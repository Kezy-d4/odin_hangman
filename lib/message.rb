require "colorize"

# Stores instructional and informative messages relating to the game which can
# be printed to the console for a responsive user experience.
module Message
  def input_instructions_msg
    "Submit your next guess. You may guess a single letter or try to guess " \
      "the entire word. Alternatively, submit \"exit\" to save and exit the " \
      "game. Your input is not case sensitive: "
  end

  def play_again_msg
    "Would you like to play again? Your game will be saved if not. [Y/n]: "
  end

  def try_again_msg
    "Please try again."
  end

  def invalid_input_msg
    "Invalid previous input! Ensure your guess consists only of " \
    "letters and is of a valid length.".colorize(:red)
    puts try_again_msg
  end

  def save_and_exit_msg
    "Alright, your game has been saved. See you soon!"
  end

  def correct_letter_msg(input)
    "Yes! \"#{input.join.upcase}\" exists in the word."
  end

  def incorrect_letter_msg(input)
    "There is no \"#{input.join.upcase}\" in the word."
  end

  def invalid_letter_msg(input)
    "You've already guessed \"#{input.join.upcase}\"!".colorize(:red)
    puts try_again_msg
  end

  def correct_word_msg
    "You got it! "
  end

  def incorrect_word_msg(input)
    "\"#{input.join.upcase}\" is not the correct word."
  end
end
