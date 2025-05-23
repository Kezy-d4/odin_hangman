require_relative "secret_word"
require_relative "player"
require_relative "turn"
require_relative "display"
require_relative "message"
require_relative "validate_input"

# Coordinates single round loop
class Round
  include Display
  include Message
  include ValidateInput

  def initialize
    @secret_word = SecretWord.new.secret_word.chars
    @player = Player.new
  end

  attr_reader :secret_word
  attr_accessor :player

  def play
    loop do
      turn = Turn.new(secret_word, player)
      player_input = turn.play
      clear_console
      feedback(player_input, secret_word, player)
      return player_input if exit?(player_input)
    end
  end
end

Round.new.play
