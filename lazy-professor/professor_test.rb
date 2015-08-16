#!/usr/bin/env ruby -w

require "minitest/autorun"
require "minitest/pride"

require_relative "professor.rb"

class ProfessorTest < Minitest::Test
  def test_professor_small_grades
    @professor = Professor.new "small-case.txt"
    assert_equal "ABDCAACB", @professor.answers
  end

  def test_professor_small_grades
    @professor = Professor.new "test.txt"
    assert_equal "BACBCAAACBCAAABDABBBBDBCBDAABDADDACBAACADDBAABABCB", @professor.answers
  end
end
