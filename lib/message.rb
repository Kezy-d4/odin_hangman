require "colorize"

# Informs, instructs, and updates the player about the game via messages printed
# to the console for a responsive user experience.
module Message
  def welcome_msg
    puts "Let's play Hangman!"
  end

  def number_of_attempts_info_msg
    puts "You'll have eight attempts to guess the secret word."
  end

  def input_instructions_msg
    print "Submit your next guess. You may guess a single remaining letter or " \
          "try to guess the entire word: "
  end

  def generally_invalid_input_msg
    puts "Invalid previous entry! Please try again.".colorize(:red)
  end

  def invalid_letter_input_msg
    puts "You've already guessed that letter! Please try again.".colorize(:red)
  end

  def incorrect_word_msg
    puts "That's not the correct word. On to your next guess."
  end

  def incorrect_letter_msg
    puts "That letter's not in the word. On to your next guess."
  end

  def correct_letter_msg
    puts "You guessed a correct letter. On to your next guess."
  end

  def player_wins_msg
    puts "You guessed the secret word. Well played!"
  end

  def player_loses_msg
    puts "You failed to guess the secret word. Poor Hangman..."
  end
end
