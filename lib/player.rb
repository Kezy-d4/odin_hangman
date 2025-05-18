require_relative "message"

class Player
  include Message

  def initialize
    @letters_guessed = []
  end

  attr_reader :game
  attr_accessor :letters_guessed

  def guess
    input_instructions_msg
    gets.chomp.downcase.chars
  end

  def to_s
    "Player has already guessed letters \"#{letters_guessed.join(', ')}\"."
  end
end
