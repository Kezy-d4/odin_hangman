require_relative "secret_word"
require_relative "player"

# Coordinates single round loop
class Round
  def initialize
    @secret_word = SecretWord.new.secret_word.chars
    @player = Player.new
  end
end
