require_relative "display"

# Defines and stores state relating to the player, and allows them to submit
# their input.
class Player
  def initialize
    @letters_already_guessed = []
    @incorrect_guesses_remaining = Display::HANGMAN_PICS.length
  end
end
