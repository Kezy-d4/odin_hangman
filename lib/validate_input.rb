require_relative "message"

# Validates player's input and prints corresponding feedback to console.
class ValidateInput
  include Message

  def initialize(input, secret_word, player)
    @input = input
    @secret_word = secret_word
    @player = player
  end

  attr_reader :input, :secret_word, :player

  def single_length?
    input.length == 1
  end

  def full_length?
    input.length == secret_word.length
  end

  def all_letters?
    input.all? { |char| ("a".."z").to_a.include?(char) }
  end

  def letter_not_yet_guessed?
    input.none? { |char| player.letters_already_guessed.include?(char) }
  end

  def letter_already_guessed?
    input.any? { |char| player.letters_already_guessed.include?(char) }
  end

  def valid_letter?
    single_length? && all_letters? && letter_not_yet_guessed?
  end

  def correct_letter?
    valid_letter? && secret_word.include?(input.join)
  end

  def invalid_letter?
    single_length? && all_letters? && letter_already_guessed?
  end

  def valid_word?
    full_length? && all_letters?
  end

  def correct_word?
    input == secret_word
  end

  def valid?
    valid_letter? || valid_word?
  end

  def valid_but_incorrect?
    valid? && !correct_letter? && !correct_word?
  end

  def single_length_feedback
    if valid_letter?
      correct_letter? ? correct_letter_msg(input) : incorrect_letter_msg(input)
    elsif invalid_letter?
      invalid_letter_msg(input)
    else
      invalid_input_msg
    end
  end

  def full_length_feedback
    if valid_word?
      correct_word? ? correct_word_msg : incorrect_word_msg(input)
    else
      invalid_input_msg
    end
  end

  def feedback
    if single_length?
      single_length_feedback
    elsif full_length?
      full_length_feedback
    else
      invalid_input_msg
    end
  end
end
