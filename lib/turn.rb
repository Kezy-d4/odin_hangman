require_relative "display"
require_relative "message"

# Coordinates single turn loop.
class Turn
  include Display
  include Message

  def initialize(secret_word, player)
    @secret_word = secret_word
    @player = player
  end

  attr_reader :secret_word
  attr_accessor :player

  def play
    print_hangman_pic(player.incorrect_guesses_made) unless player.incorrect_guesses_made.zero?
    print_secret_word_progress(secret_word, player)
    puts player_state_msg(player)
    player.input
  end
end
