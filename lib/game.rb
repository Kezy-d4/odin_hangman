require_relative "secret_word"
require_relative "player"
require_relative "validate_guess"
require_relative "display"
require_relative "message"

class Game
  include ValidateGuess
  include Display
  include Message

  def initialize
    welcome_msg # Testing
    @secret_word = SecretWord.new.secret_word.chars
    @player = Player.new
  end

  attr_reader :secret_word, :player

  # Testing
  def play
    loop do
      guess = player.guess
      feedback(guess)
      break if valid?(guess)
    end
  end

  def to_s
    "The secret word is \"#{secret_word.join}\"."
  end
end

# Testing
g = Game.new
puts g
g.player.letters_guessed << "z"
g.player.letters_guessed << "x"
puts g.player
g.play
