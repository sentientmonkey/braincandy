class ScrabbleWords
  attr_reader :words

  def initialize filename=nil
    @words = normalize(fetch(filename))
  end

  def fetch filename
    filename ||= "/usr/share/dict/words"
    File.readlines filename
  end

  def normalize array
    array.map(&:chomp).map(&:downcase)
  end

  def find letters
    results = []
    combinations = []
    2.upto(letters.length) do |size|
      combinations << letters.combination(size).map{ |c| c.permutation.map { |a| a.join '' } }
    end
    combinations.flatten!
    words.select{|word| combinations.include? word }
  end
end
