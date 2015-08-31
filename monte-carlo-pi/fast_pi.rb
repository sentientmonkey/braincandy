#!/usr/bin/env ruby
require 'bigdecimal'

class FastPi
  attr_reader :size, :pi

  def initialize size
    @size = size
    calculate_pi
  end

  def bd number
    BigDecimal.new number.to_s
  end

  # calculates pi up to size digits
  # using the BBP forumla
  # https://en.wikipedia.org/wiki/Bailey–Borwein–Plouffe_formula
  def calculate_pi
    @pi = bd(0)
    size.times do |n|
      k = bd(n)
      @pi = @pi + (bd(16)**-k) *
        ((bd(4)/(bd(8)*k + bd(1))) -
         (bd(2)/(bd(8)*k + bd(4))) -
         (bd(1)/(bd(8)*k + bd(5))) -
         (bd(1)/(bd(8)*k + bd(6))))
    end
  end

  def to_s
    pi.to_s "F"
  end
end

if __FILE__ == $0 || $0 =~ /ruby-prof/
  n = (ARGV[0] || 6).to_i
  fast_pi = FastPi.new n
  puts fast_pi.to_s
end
