require_relative "secret_word"
require_relative "player"
require_relative "validate_guess"
require_relative "display"
require_relative "message"

# Coordinates the gameplay loop
class Game
  include ValidateGuess
  include Display
  include Message

  @@win_streak = 0 # rubocop:disable Style/ClassVars

  def initialize
    @secret_word = SecretWord.new.secret_word.chars
    @player = Player.new
  end

  attr_reader :secret_word, :player
  attr_accessor :win_streak

  def self.play
    loop do
      g = Game.new
      g.game_loop
      g.player_loses? ? @@win_streak = 0 : @@win_streak += 1 # rubocop:disable Style/ClassVars
      ans = g.player.play_again?
      system "clear"
      next if ans

      puts "Alright, thanks for playing. See you soon!"
      break
    end
  end

  def game_loop
    welcome_msg
    secret_word_length_msg
    win_streak_msg(@@win_streak)
    guess_loop
    player_loses? ? print_secret_word : print_full_secret_word
    player_loses? ? player_loses_msg : player_wins_msg
  end

  def player_loses?
    player.incorrect_guesses == Display::HANGMAN_PICS.length
  end

  private

  def guess_loop
    loop do
      guess = prompt_guess
      clear_console_and_feedback(guess)
      update_player_state_and_print_hangman(guess)
      break if game_over?(guess)
    end
  end

  def prompt_guess
    print_secret_word
    player_state_msg
    player.guess
  end

  def clear_console_and_feedback(guess)
    clear_console
    feedback(guess)
  end

  def update_player_state_and_print_hangman(guess)
    player.incorrect_guesses += 1 if valid_but_incorrect?(guess)
    print_hangman_pic(player.incorrect_guesses) unless player.incorrect_guesses.zero?
    player.letters_guessed << guess.join if valid_letter?(guess)
  end

  def player_wins?(guess)
    correct_word?(guess) ||
      secret_word.all? { |letter| player.letters_guessed.include?(letter) }
  end

  def game_over?(guess)
    player_wins?(guess) || player_loses?
  end
end
