require "minitest/autorun"
require "minitest/pride"

require_relative "scrabble.rb"

class ScrabbleWordsTest < Minitest::Test
  def setup
    @simple_scrabble_words = ScrabbleWords.new "test_words.txt"
    @scrabble_words = ScrabbleWords.new
  end

  def test_sample_word
    words = @simple_scrabble_words.find %w(a p p l e)
    assert_equal words, %w(ape apple)
  end

  def test_scrambled_word
    words = @simple_scrabble_words.find %w(p p a e l)
    assert_equal words, %w(ape apple)
  end

  def test_full_words
    words = @scrabble_words.find %w(a p p l e)
    assert_equal words, ["ae", "al", "al", "ale", "alp", "ape", "apple", "ea", "el", "la", "lap", "lapp", "lea", "lea", "leap", "lepa", "pa", "pal", "pale", "palp", "pap", "pape", "pea", "peal", "pep", "plap", "plea"]
  end
end
