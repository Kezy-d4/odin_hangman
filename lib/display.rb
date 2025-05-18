# Stores and prints the hangman ASCII art.
module Display
  HANGMAN_PICS = ['
    +---+
        |
        |
        |
        |
        |
  =========', '
    +---+
        |
    O   |
        |
        |
        |
  =========', '
    +---+
        |
    O   |
    |   |
        |
        |
  =========', '
    +---+
        |
    O   |
   /|   |
        |
        |
  =========', '
    +---+
        |
    O   |
   /|\  |
        |
        |
  =========', '
    +---+
        |
    O   |
   /|\  |
   /    |
        |
  =========', '
    +---+
        |
    O   |
   /|\  |
   / \  |
        |
  =========', '
    +---+
    |   |
    O   |
   /|\  |
   / \  |
        |
  ========='].freeze

  def print_hangman_pic(number)
    index = number - 1
    puts HANGMAN_PICS[index]
  end
end
