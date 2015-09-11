#!/usr/bin/env ruby -w

require "minitest/autorun"
require "minitest/benchmark"
require "minitest/pride"

require_relative "pascal.rb"

class BenchmarkPascal < Minitest::Benchmark
  include PascalTriangle

  def bench_pascal
    assert_performance_linear 0.9999 do |n|
      pascal_triangle n
    end
  end
end
