#!/usr/bin/env ruby -w

module PascalTriangle
  def pascal_triangle n
    case n
    when 1
      [1]
    when 2
      [1,1]
    else
      t = pascal_triangle(n-1)
      r = []
      r << t[0]
      (n-2).times do |i|
        r << (t[i] + t[i+1])
      end
      r << t[n-2]
      r
    end
  end
end

if __FILE__ == $0
  include PascalTriangle
  t = pascal_triangle ARGV[0].to_i
  puts t.inspect
end
