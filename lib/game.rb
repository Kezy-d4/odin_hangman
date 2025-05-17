require_relative "secret_word"
require_relative "display_art"
require_relative "message"

class Game
  include DisplayArt
  include Message

  def initialize
    @secret_word = SecretWord.new.secret_word.chars
    @letters = ("a".."z").to_a
    @letters_guessed = []
  end

  attr_reader :secret_word, :letters
  attr_accessor :letters_guessed

  def guess
    input_instructions_msg
    gets.chomp.downcase.chars
  end

  def valid_guess?(guess)
    all_letters?(guess) &&
      no_letters_already_guessed?(guess) &&
      valid_guess_length?(guess)
  end

  def single_letter_guess?(guess)
    guess.length == 1
  end

  def full_word_guess?(guess)
    guess.length == secret_word.length
  end

  def valid_guess_length?(guess)
    single_letter_guess?(guess) || full_word_guess?(guess)
  end

  def all_letters?(guess)
    guess.all? { |char| letters.include?(char) }
  end

  def no_letters_already_guessed?(guess)
    guess.none? { |char| letters_guessed.include?(char) }
  end

  def to_s
    "The secret word is #{secret_word.join}."
  end
end

# Debugging
g = Game.new
puts g
puts "Secret word length: #{g.secret_word.length}"
puts "Try again" until g.valid_guess?(g.guess)
