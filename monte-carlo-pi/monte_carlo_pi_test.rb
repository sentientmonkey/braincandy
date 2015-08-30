#!/usr/bin/env ruby -w

require "minitest/autorun"
require "minitest/pride"

require_relative "monte_carlo_pi.rb"

class MonteCarloPiTest < Minitest::Test
  def setup
    @monte_carlo = MonteCarloPi.new 10_000
  end

  def test_generate_pi
    assert_in_delta @monte_carlo.pi, Math::PI, 0.1
  end

  def test_in_circle
    assert @monte_carlo.in_circle? 0.5, 0.5, 1.0
  end

  def test_out_of_circle
    refute @monte_carlo.in_circle? 1.0, 1.0, 1.0
  end

  def test_generate_points
    points = @monte_carlo.generate_points 10
    assert_equal 10, points.length
    points.each do |p|
      assert_in_delta 0.0, p.x, 1.0
      assert_in_delta 0.0, p.y, 1.0
    end
  end
end
