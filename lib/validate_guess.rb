# Validates the players' guess and prints the appropriate feedback to the console.
module ValidateGuess
  def single_length?(guess)
    guess.length == 1
  end

  def full_length?(guess)
    guess.length == secret_word.length
  end

  def all_letters?(guess)
    guess.all? { |char| ("a".."z").to_a.include?(char) }
  end

  def letter_not_yet_guessed?(guess)
    guess.none? { |char| player.letters_guessed.include?(char) }
  end

  def letter_already_guessed?(guess)
    guess.any? { |char| player.letters_guessed.include?(char) }
  end

  def valid_letter?(guess)
    single_length?(guess) && all_letters?(guess) && letter_not_yet_guessed?(guess)
  end

  def valid_word?(guess)
    full_length?(guess) && all_letters?(guess)
  end

  def correct_letter?(guess)
    valid_letter?(guess) && secret_word.include?(guess.join)
  end

  def invalid_letter?(guess)
    single_length?(guess) && all_letters?(guess) && letter_already_guessed?(guess)
  end

  def correct_word?(guess)
    guess == secret_word
  end

  def valid?(guess)
    valid_letter?(guess) || valid_word?(guess)
  end

  def valid_but_incorrect?(guess)
    valid?(guess) && !correct_letter?(guess) && !correct_word?(guess)
  end

  def single_length_feedback(guess)
    if valid_letter?(guess)
      correct_letter?(guess) ? correct_letter_msg(guess) : incorrect_letter_msg(guess)
    elsif invalid_letter?(guess)
      invalid_letter_msg(guess)
    else
      invalid_input_msg
    end
  end

  def full_length_feedback(guess)
    if valid_word?(guess)
      correct_word?(guess) ? correct_word_msg : incorrect_word_msg(guess)
    else
      invalid_input_msg
    end
  end

  def feedback(guess)
    if single_length?(guess)
      single_length_feedback(guess)
    elsif full_length?(guess)
      full_length_feedback(guess)
    else
      invalid_input_msg
    end
  end
end
