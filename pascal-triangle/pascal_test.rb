#!/usr/bin/env ruby -w

require "minitest/autorun"
require "minitest/pride"

require_relative "pascal.rb"

class TestPascalTriangle < Minitest::Test
  def t n
    PascalTriangle.new n
  end

  def test_pascal_first
    assert_equal [[1]], t(1).triangle
  end

  def test_pascal_second
    assert_equal [[1], [1,1]], t(2).triangle
  end

  def test_pascal_three
    assert_equal [[1], [1,1], [1,2,1]], t(3).triangle
  end

  def test_pascal_four
    assert_equal [[1], [1,1], [1,2,1], [1,3,3,1]], t(4).triangle
  end

  def test_pascal_five
    assert_equal [[1], [1,1], [1,2,1], [1,3,3,1], [1,4,6,4,1]], t(5).triangle
  end
end
