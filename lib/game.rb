require "yaml"
require_relative "round"
require_relative "display"
require_relative "message"

# Coordinates overall gameplay loop as well saving and loading the game. The
# game will only accommodate one save file at a time.
class Game
  extend Display
  extend Message

  SAVED_GAME_PATH = "saved_game/save_file.yaml".freeze

  def initialize(win_streak = 0, current_round = nil)
    @win_streak = win_streak
    @current_round = current_round
  end

  attr_accessor :win_streak, :current_round

  def self.construct
    game = nil
    game = load_game if !File.empty?(SAVED_GAME_PATH) && load_previous_save?
    game = Game.new if game.nil?
    game.current_round = Round.new if game.current_round.nil?
    game
  end

  def self.play # rubocop:disable Metrics/AbcSize
    game = start
    loop do
      game.current_round = Round.new if game.current_round.nil?
      round_open_info(game)
      round_result = game.current_round.play
      game.save_game && return if round_result == "exit"

      game.current_round = nil
      round_result == "won" ? game.win_streak += 1 : game.win_streak = 0
      play_again? ? next : game.save_game && return
    end
  end

  def self.start
    clear_console
    puts welcome_msg
    sleep(2.5)
    construct
  end

  def self.round_open_info(game)
    clear_console
    puts win_streak_msg(game.win_streak)
    puts secret_word_length_msg(game.current_round.secret_word)
  end

  def save_game
    puts self.class.save_and_exit_msg
    serialized = YAML.dump(
      { win_streak: @win_streak,
        current_round: @current_round }
    )
    File.write(SAVED_GAME_PATH, serialized)
  end

  def self.load_game
    deserialized = YAML.load_file(
      SAVED_GAME_PATH,
      permitted_classes: [Round, SecretWord, Player, Symbol]
    )
    new(
      deserialized[:win_streak],
      deserialized[:current_round]
    )
  end

  def self.load_previous_save? # rubocop:disable Metrics/MethodLength
    print load_save_msg
    inp = gets.chomp.downcase
    if %w[y yes].include?(inp)
      puts save_loaded_msg
      sleep(2.5)
      true
    else
      puts new_game_msg
      sleep(2.5)
      false
    end
  end

  def self.play_again?
    print play_again_msg
    inp = gets.chomp.downcase
    %w[y yes].include?(inp)
  end
end
