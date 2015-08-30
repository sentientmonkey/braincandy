#!/usr/bin/env ruby

class FastPi
  attr_reader :size, :pi

  def initialize size
    @size = size
    calculate_pi
  end

  # calculates pi up to size digits
  # using the BBP forumla
  # https://en.wikipedia.org/wiki/Bailey–Borwein–Plouffe_formula
  def calculate_pi
    @pi = 0.0
    size.times do |k|
      @pi += (16.0**-k) *
        ((4.0/(8.0*k + 1.0)) -
         (2.0/(8.0*k + 4.0)) -
         (1.0/(8.0*k + 5.0)) -
         (1.0/(8.0*k + 6.0)))
    end
  end

  def to_s
    "%0.#{size}f" % pi
  end
end

if __FILE__ == $0 || $0 =~ /ruby-prof/
  n = (ARGV[0] || 6).to_i
  fast_pi = FastPi.new n
  puts fast_pi.to_s
end
