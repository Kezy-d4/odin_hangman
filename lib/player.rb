require_relative "message"

# Defines and stores the players' state, and allows them to submit their input.
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

  def play_again?
    ask_to_play_again_msg
    ans = gets.chomp.downcase
    %w[yes y].include?(ans)
  end
end
