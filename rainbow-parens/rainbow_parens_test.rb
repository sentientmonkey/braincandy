require "minitest/autorun"
require "minitest/pride"

require_relative "rainbow_parens.rb"

class ParensTest < Minitest::Test

  def setup
    @parens = Parens.new
  end

  def parens
    @parens
  end

  def test_blank_string
    assert parens.valid? ""
  end

  def test_invalid_parens
    refute parens.valid? "[(])"
  end

  def test_invalid_with_missing_trailing
    refute parens.valid? "((()"
  end

  def test_valid_parens
    assert parens.valid? "[()]{}{[()()]()}"
  end

  def test_with_spaces
    assert parens.valid? "   [  (  ) ] {}   {[   ()()] ()}   "
  end

  def test_valid_smile
    assert parens.valid? "(define smile \"(:\")"
  end

  def test_valid_code
    assert parens.valid? "(define (lambda (x) (add5 (+ 5 x))))"
  end

  def test_invalid_code
    assert parens.valid? "(define (lambda (x) (add5 (+ 5 x))))"
  end

  def test_rainbow_parens
    result = parens.rainbow "[()]{}{[()()]()}"
    assert_equal result, "\e[31m[\e[0m\e[32m(\e[0m\e[32m)\e[0m\e[31m]\e[0m\e[33m{\e[0m\e[33m}\e[0m\e[34m{\e[0m\e[35m[\e[0m\e[36m(\e[0m\e[36m)\e[0m\e[31m(\e[0m\e[31m)\e[0m\e[35m]\e[0m\e[32m(\e[0m\e[32m)\e[0m\e[34m}\e[0m"
  end

  def test_rainbow_code
    result = parens.rainbow "(define (lambda (x) (add5 (+ 5 x))))"
    assert_equal result, "\e[31m(\e[0mdefine \e[32m(\e[0mlambda \e[33m(\e[0mx\e[33m)\e[0m \e[34m(\e[0madd5 \e[35m(\e[0m+ 5 x\e[35m)\e[0m\e[34m)\e[0m\e[32m)\e[0m\e[31m)\e[0m"
  end

  def test_rainbow_escaping
    result = parens.rainbow "(define smile \":)\")"
    assert_equal result, "\e[31m(\e[0mdefine smile \":)\"\e[31m)\e[0m"
  end
end
