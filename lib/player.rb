require_relative "display"
require_relative "message"

# Defines and stores state relating to the player, and allows them to submit
# their input during a round.
class Player
  include Message

  def initialize
    @letters_already_guessed = []
    @incorrect_guesses_made = 0
    @incorrect_guesses_remaining = Display::HANGMAN_PICS.length
  end

  attr_accessor :letters_already_guessed, :incorrect_guesses_made,
                :incorrect_guesses_remaining

  def input
    print input_instructions_msg
    gets.chomp.downcase.chars
  end

  def exit?(input)
    input.join == "exit"
  end
end
