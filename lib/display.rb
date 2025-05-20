# Prints the Hangman ASCII art and secret word to the console, and clears the
# console.
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

  def print_secret_word
    puts
    secret_word.each do |letter|
      if player.letters_guessed.include?(letter)
        print "#{letter.upcase} "
      else
        print "_ "
      end
    end
    2.times { puts }
  end

  def print_full_secret_word
    puts
    secret_word.each { |letter| print "#{letter.upcase} " }
    2.times { puts }
  end

  def clear_console
    system "clear"
  end
end
