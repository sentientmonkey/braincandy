#!/usr/bin/env ruby

require "minitest/autorun"
require "minitest/pride"

require_relative "fast_pi.rb"

class FastPiTest < Minitest::Test
  def test_pi
    size = 40
    fast_pi = FastPi.new size
    pi = fast_pi.pi
    assert_in_delta Math::PI, pi, 10.0**-size
  end
end
