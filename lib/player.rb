require_relative "message"

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

  def to_s
    "You've already guessed these letters: " \
      "\"#{letters_guessed.join(', ').upcase}\". " \
      "Guesses remaining: #{guesses_available - incorrect_guesses}."
  end
end
