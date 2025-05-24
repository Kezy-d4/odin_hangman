# Prints core game elements such as the Hangman ASCII art and secret word to
# console, and clears console.
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

  def print_secret_word(secret_word)
    puts
    secret_word.each { |letter| print "#{letter.upcase} " }
    2.times { puts }
  end

  def print_obscured_secret_word(secret_word)
    puts
    secret_word.each { print "_ " }
    2.times { puts }
  end

  def print_secret_word_progress(secret_word, player)
    puts
    secret_word.each do |letter|
      print player.letters_already_guessed.include?(letter) ? "#{letter.upcase} " : "_ "
    end
    2.times { puts }
  end

  def clear_console
    system "clear"
    system "cls"
  end
end
