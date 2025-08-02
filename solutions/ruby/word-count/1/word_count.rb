class Phrase
  attr_reader :words, :words_hash
  
  def initialize(words)
    @words = words
    @words_hash = self.make_words_hash(words)
  end

  def make_words_hash(words)
    # Initialize hash with default value for easier lookup and mutation
    words_hash = Hash.new(0)

    # Get only the words we care about
    scanned = words.scan(/\w+(?:'\w+)*/)
    
    scanned.each do |word|
      key = word.downcase.strip
      
      next if key.empty?
      
      words_hash[key] += 1
    end

    words_hash
  end

  def word_count
    words_hash
  end
end