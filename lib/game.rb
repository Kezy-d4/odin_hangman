require_relative "secret_word"
require_relative "display_art"
require_relative "message"

class Game
  include DisplayArt
  include Message

  def initialize
    @word = SecretWord.new
  end

  attr_reader :word

  def play
  end
end
