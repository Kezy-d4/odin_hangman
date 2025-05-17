# Loads the word list source file, processes it to remove words not of a valid
# length, and randomly assigns a word from this processed list as its secret
# word.
class SecretWord
  def initialize
    @secret_word = randomly_assign_secret_word
  end

  attr_reader :secret_word

  private

  def word_list_from_source_to_array
    File.open("word_list/google_10000_english_no_swears.txt", "r") do |f|
      File.readlines(f).map(&:chomp)
    end
  end

  def valid_word_length?(word)
    word.length.between?(5, 12)
  end

  def process_word_list
    word_list_from_source_to_array.select { |word| valid_word_length?(word) }
  end

  def randomly_assign_secret_word
    process_word_list.sample
  end
end
