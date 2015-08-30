#!/usr/bin/env ruby

class MonteCarloPi
  Point = Struct.new :x, :y

  attr_reader :points

  def initialize sample_size
    @points = generate_points sample_size
  end

  def pi
    m, n = test_points
    (4.0 * m) / n
  end

  def test_points
    results = points.group_by do |p|
      in_circle? x: p.x, y: p.y, radius: 0.75
    end
    [results[true].length, results[false].length]
  end

  def generate_points size
    Array.new(size){ Point.new rand, rand }
  end

  # assumes 0,0 origin
  def in_circle? x: x, y: y, radius: radius
    Math.sqrt(x**2 + y**2) < radius
  end
end

if __FILE__ == $0
  n = (ARGV[0] || 10000).to_i
  puts MonteCarloPi.new(n).pi
end
