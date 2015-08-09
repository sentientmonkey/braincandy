require "set"

class ScrabbleWords
  attr_reader :words

  def initialize filename=nil
    @words = Set.new normalize(fetch(filename))
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

    (letters.length).downto(2) do |size|
      combinations << letters.combination(size).map{ |c| c.permutation.map { |a| a.join '' } }
    end
    combinations = combinations.flatten.uniq

    combinations.select{|word| words.include? word }
  end
end

if __FILE__==$0
  require "benchmark"
  bm = Benchmark.measure {
    scrabble = ScrabbleWords.new
    letters = ARGV[0].chars
    $stdout.puts scrabble.find letters
  }
  $stderr.puts "Benchmark: #{bm}"
end
