# Validates player's input and prints corresponding feedback to the console.
# TODO: convert this module to a class to alleviate the messy passing of
# arguments
module ValidateInput
  def exit?(input)
    input == "exit"
  end

  def single_length?(input)
    input.length == 1
  end

  def full_length?(input, secret_word)
    input.length == secret_word.length
  end

  def all_letters?(input)
    input.all? { |char| ("a".."z").to_a.include?(char) }
  end

  def letter_not_yet_guessed?(input, player)
    input.none? { |char| player.letters_already_guessed.include?(char) }
  end

  def letter_already_guessed?(input, player)
    input.any? { |char| player.letters_already_guessed.include?(char) }
  end

  def valid_letter?(input, player)
    single_length?(input) && all_letters?(input) && letter_not_yet_guessed?(input, player)
  end

  def correct_letter?(input, secret_word)
    valid_letter?(input) && secret_word.include?(input.join)
  end

  def invalid_letter?(input)
    single_length?(input) && all_letters?(input) && letter_already_guessed?(input)
  end

  def valid_word?(input)
    full_length?(input) && all_letters?(input)
  end

  def correct_word?(input, secret_word)
    input == secret_word
  end

  def valid?(input)
    valid_letter?(input) || valid_word?(input)
  end

  def valid_but_incorrect?(input)
    valid?(input) && !correct_letter?(input) && !correct_word?(input)
  end

  def single_length_feedback(input, secret_word, player)
    if valid_letter?(input, player)
      puts correct_letter?(input, secret_word) ? correct_letter_msg(input) : incorrect_letter_msg(input)
    elsif invalid_letter?(input)
      puts invalid_letter_msg(input)
    else
      puts invalid_input_msg
    end
  end

  def full_length_feedback(input, secret_word)
    if valid_word?(input)
      puts correct_word?(input, secret_word) ? correct_word_msg : incorrect_word_msg(input)
    else
      puts invalid_input_msg
    end
  end

  def feedback(input, secret_word, player)
    if exit?(input)
      puts save_and_exit_msg
    elsif single_length?(input)
      single_length_feedback(input, secret_word, player)
    elsif full_length?(input, secret_word)
      full_length_feedback(input, secret_word)
    else
      invalid_input_msg
    end
  end
end
