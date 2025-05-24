require "colorize"

# Stores instructional and informative messages relating to the game which can
# be printed to console for a responsive user experience.
module Message
  def save_loaded_msg
    "Alright, let's resume your previous saved game."
  end

  def new_game_msg
    "Alright, let's start a new game."
  end

  def welcome_msg
    "Let's play Hangman!"
  end

  def win_streak_msg(win_streak)
    v1 = "Win streak: #{win_streak}."
    v2 = "Win streak: #{win_streak}. You're on a roll!"
    win_streak.positive? ? v2 : v1
  end

  def secret_word_length_msg(secret_word)
    puts "The secret word is #{secret_word.length} letters long."
  end

  def input_instructions_msg
    "Submit your next guess. You may guess a single letter or try to guess " \
      "the entire word. Alternatively, submit \"exit\" to save and exit the " \
      "game. Your input is not case sensitive: "
  end

  def play_again_msg
    "Would you like to play again? Your game will be saved if not. [Y/n]: "
  end

  def invalid_input_msg
    "Invalid previous input! Ensure your guess consists only of " \
    "letters and is of a valid length. Please try again.".colorize(:red)
  end

  def save_and_exit_msg
    "Alright, your game has been saved. See you soon!"
  end

  def load_save_msg
    "Would you like to load your previously saved game? [Y/n]: "
  end

  def player_state_msg(player)
    "You've already guessed these letters: " \
      "\"#{player.letters_already_guessed.join(', ').upcase}\". " \
      "Incorrect guesses remaining: " \
      "#{player.incorrect_guesses_remaining}."
  end

  def player_won_msg
    "You guessed the secret word and saved the Hangman. Well played!"
  end

  def player_lost_msg(secret_word)
    "You didn't guess the secret word in time. Poor Hangman... The secret " \
      "word was \"#{secret_word.join.upcase}\"."
  end

  def correct_letter_msg(input)
    "Yes! \"#{input.join.upcase}\" exists in the word."
  end

  def incorrect_letter_msg(input)
    "There is no \"#{input.join.upcase}\" in the word."
  end

  def invalid_letter_msg(input)
    "You've already guessed \"#{input.join.upcase}\"! " \
    "Please try again.".colorize(:red)
  end

  def correct_word_msg
    "You got it!"
  end

  def incorrect_word_msg(input)
    "\"#{input.join.upcase}\" is not the correct word."
  end
end
