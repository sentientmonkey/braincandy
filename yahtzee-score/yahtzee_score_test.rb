#/usr/bin/env ruby -w

require "minitest/autorun"
require "minitest/pride"

require_relative "yahtzee_score.rb"

class YahtzeeScoreTest < Minitest::Test

  def setup
    @score = YahtzeeScore.new
  end

  def test_roll
    dice = Dice.roll!
    assert_kind_of Array, dice.roll
    assert_equal 5, dice.roll.length
    dice.roll.each do |die|
      assert die >= 1 && die <= 6
    end
  end

  def test_score_combo_over_ones
    combo = Dice.new 1,1,2,3,4
    assert_equal 11, @score.score(combo)
  end

  def test_score_combos
    skip
    # can't seem to figure how how Ones, Twos, etc will ever beat chance
  end

  def test_score_three_of_a_kind
    three_of_a_kind = Dice.new 1,1,1,4,5,6
    assert_equal 18, @score.score(three_of_a_kind)
  end

  def test_score_four_of_a_kind
    three_of_a_kind = Dice.new 1,5,1,6,1,1
    assert_equal 15, @score.score(three_of_a_kind)
  end

  def test_score_full_house
    full_house = Dice.new 1,1,2,2,1,1
    assert_equal 25, @score.score(full_house)
  end

  def test_score_small_straight
    small_straight = Dice.new 1,1,1,1,2,2
    assert_equal 30, @score.score(small_straight)
  end

  def test_score_large_straight
    large_straight = Dice.new 1,1,1,1,1,2
    assert_equal 40, @score.score(large_straight)
  end

  def test_score_yahtzee
    yahtzee = Dice.new 1,1,1,1,1,1
    assert_equal 50, @score.score(yahtzee)
  end

  def test_chance
    chance = Dice.new 3,2,1,5,6
    assert_equal 17, @score.score(chance)
  end

  def test_random_score
    result = @score.score Dice.roll!
    assert result >= 1 && result <= 50
  end
end
