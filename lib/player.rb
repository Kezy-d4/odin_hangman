require_relative "display"

class Player
  def initialize
    @letters_already_guessed = []
    @incorrect_guesses_remaining = Display::HANGMAN_PICS.length
  end
end
