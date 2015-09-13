#!/usr/bin/env ruby -w

require "minitest/autorun"
require "minitest/benchmark"
require "minitest/pride"

require_relative "pascal.rb"

class BenchmarkPascal < Minitest::Benchmark
  def bench_pascal
    assert_performance_linear 0.9999 do |n|
      t = PascalTriangle.new n
      t.triangle
    end
  end
end
