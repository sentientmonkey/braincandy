#!/usr/bin/env ruby -w

class PascalTriangle
  attr_reader :triangle

  def initialize n
    @triangle = []
    1.upto(n).each{|i| @triangle << level(i) }
  end

  def level n
    case n
    when 1
      [1]
    when 2
      [1,1]
    else
      t = level(n-1)
      r = []
      r << t[0]
      (n-2).times do |i|
        r << (t[i] + t[i+1])
      end
      r << t[n-2]
      r
    end
  end

  def to_s
    triangle.map{|k| k.join ' ' }.join "\n"
  end
end

if __FILE__ == $0
  t = PascalTriangle.new ARGV[0].to_i
  puts t
end
