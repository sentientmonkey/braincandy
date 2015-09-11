#!/usr/bin/env ruby -w

require "minitest/autorun"
require "minitest/benchmark"
require "minitest/pride"

require_relative "pascal.rb"

class BenchmarkPascal < Minitest::Benchmark
  def bench_pascal
    t = PascalTriangle.new
    assert_performance_linear 0.9999 do |n|
      t.pascal_triangle n
    end
  end
end
