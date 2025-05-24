require_relative "secret_word"
require_relative "player"
require_relative "turn"
require_relative "display"
require_relative "message"
require_relative "validate_input"

# Coordinates single round loop
class Round
  include Display
  include Message

  def initialize
    @secret_word = SecretWord.new.secret_word.chars
    @player = Player.new
  end

  attr_reader :secret_word
  attr_accessor :player

  def play
    loop do
      player_input = play_turn
      clear_console
      return player_input.join if player.exit?(player_input)

      validate(player_input)
      next unless round_over?(player_input)

      clear_console
      end_of_round
      return result
    end
  end

  def play_turn
    turn = Turn.new(secret_word, player)
    turn.play
  end

  def validate(player_input)
    validation = ValidateInput.new(player_input, secret_word, player)
    puts validation.feedback
    player.incorrect_guesses_made += 1 if validation.valid_but_incorrect?
    player.incorrect_guesses_remaining -= 1 if validation.valid_but_incorrect?
    player.letters_already_guessed << player_input.join if validation.valid_letter?
  end

  def player_won?(player_input)
    secret_word.all? { |letter| player.letters_already_guessed.include?(letter) } ||
      player_input == secret_word
  end

  def player_lost?
    player.incorrect_guesses_remaining.zero?
  end

  def round_over?(player_input)
    player_won?(player_input) || player_lost?
  end

  def end_of_round # rubocop:disable Metrics/AbcSize
    puts player_lost? ? player_lost_msg(secret_word) : player_won_msg
    print_hangman_pic(player.incorrect_guesses_made) unless player.incorrect_guesses_made.zero?
    player_lost? ? print_secret_word_progress(secret_word, player) : print_secret_word(secret_word)
  end

  def result
    player_lost? ? "lost" : "won"
  end
end
