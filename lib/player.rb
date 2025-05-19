require_relative "message"

# Defines and stores the player's state, and allows them to input their guess.
class Player
  include Message

  def initialize
    @guesses_available = Display::HANGMAN_PICS.length
    @letters_guessed = []
    @incorrect_guesses = 0
  end

  attr_reader :guesses_available
  attr_accessor :letters_guessed, :incorrect_guesses

  def guess
    input_instructions_msg
    gets.chomp.downcase.chars
  end
end
