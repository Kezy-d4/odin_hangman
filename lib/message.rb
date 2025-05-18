require "colorize"

# Informs, instructs, and updates the player about the game via messages printed
# to the console for a responsive user experience.
module Message
  def welcome_msg
    puts "Let's play Hangman!"
  end

  def input_instructions_msg
    print "Submit your next case insensitive guess. You may guess a single " \
          "letter or try to guess the entire word: "
  end

  def correct_letter_msg(guess)
    puts "Yes! \"#{guess.join.upcase}\" exists in the word."
  end

  def incorrect_letter_msg(guess)
    puts "There is no \"#{guess.join.upcase}\" in the word."
  end

  def invalid_letter_msg(guess)
    puts "You've already guessed \"#{guess.join.upcase}\"!".colorize(:red)
    try_again_msg
  end

  def correct_word_msg(secret_word)
    puts "That's it! You guessed the secret word which was " \
         "\"#{secret_word.join.upcase}\"."
  end

  def incorrect_word_msg(guess)
    puts "\"#{guess.join.upcase}\" is not the correct word."
  end

  def invalid_input_msg
    puts "Invalid previous input! Ensure your guess consists only of " \
         "letters and is of a valid length.".colorize(:red)
    try_again_msg
  end

  def try_again_msg
    puts "Please try again."
  end

  def next_guess_msg
    puts "On to your next guess."
  end

  def well_played_msg
    puts "Well played!"
  end
end
