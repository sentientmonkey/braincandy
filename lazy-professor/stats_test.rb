require "minitest/autorun"
require "minitest/pride"

require_relative "stats.rb"

using Stats

class StatsTest < Minitest::Test
  def setup
    @stats = [1,3,4,12,32,1,2]
  end

  def test_number
    assert_equal 7, @stats.number
  end

  def test_mean
    assert_in_delta 7.857, @stats.mean
  end

  def test_mean_without_elements
    assert_in_delta 0, [].mean
  end

  def test_median
    assert_equal 3, @stats.median
  end

  def test_variance
    assert_in_delta 127.810, @stats.variance
  end

  def test_variance_without_elements
    assert_in_delta 0, [].variance
  end

  def test_standard_deviation
    assert_in_delta 11.305, @stats.standard_deviation
  end

  def test_stats
    result = @stats.stats
    assert_equal @stats.number, result[:number]
    assert_equal @stats.median, result[:median]
    assert_equal @stats.mean, result[:mean]
    assert_equal @stats.variance, result[:variance]
    assert_equal @stats.standard_deviation, result[:standard_deviation]
  end
end
