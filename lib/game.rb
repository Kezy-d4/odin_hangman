require "yaml"
require_relative "round"

# Coordinates overall gameplay loop as well saving and loading the game. The
# game will only accommodate one save file at a time.
class Game
  SAVED_GAME_PATH = "saved_game/save_file.yaml".freeze

  def initialize(round_number = 0, win_streak = 0, current_round = nil)
    @round_number = round_number
    @win_streak = win_streak
    @current_round = current_round
  end

  attr_accessor :round_number, :win_streak, :current_round

  def save_game
    serialized = YAML.dump(
      { round_number: @round_number,
        win_streak: @win_streak,
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
      deserialized[:round_number],
      deserialized[:win_streak],
      deserialized[:current_round]
    )
  end
end
