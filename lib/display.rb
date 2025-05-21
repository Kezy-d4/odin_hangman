# Prints the Hangman ASCII art to the console, and clears the console.
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

  def clear_console
    system "clear"
    system "cls"
  end
end
