#!/usr/bin/env ruby -w

require "minitest/autorun"
require "minitest/pride"

require_relative "pascal.rb"

class TestPascalTriangle < Minitest::Test
  include PascalTriangle

  def test_pascal_first
    assert_equal [1], pascal_triangle(1)
  end

  def test_pascal_second
    assert_equal [1,1], pascal_triangle(2)
  end

  def test_pascal_three
    assert_equal [1,2,1], pascal_triangle(3)
  end

  def test_pascal_four
    assert_equal [1,3,3,1], pascal_triangle(4)
  end

  def test_pascal_five
    assert_equal [1,4,6,4,1], pascal_triangle(5)
  end
end
