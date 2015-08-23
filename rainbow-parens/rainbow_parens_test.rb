require "minitest/autorun"
require "minitest/pride"

require_relative "rainbow_parens.rb"

class ParensTest < Minitest::Test
  def test_blank_string
    assert Parens.valid? ""
  end

  def test_invalid_parens
    refute Parens.valid? "[(])"
  end

  def test_valid_parens
    assert Parens.valid? "[()]{}{[()()]()}"
  end

  def test_with_spaces
    assert Parens.valid? "   [  (  ) ] {}   {[   ()()] ()}   "
  end

  def test_valid_code
    assert Parens.valid? "(define (lambda (x) (add5 (+ 5 x))))"
  end

  def test_invalid_code
    assert Parens.valid? "(define (lambda (x) (add5 (+ 5 x)))"
  end

  def test_rainbow_parens
    result = Parens.rainbow "[()]{}{[()()]()}"
    assert_equal result, "\e[31m[\e[0m\e[32m(\e[0m\e[32m)\e[0m\e[31m]\e[0m\e[33m{\e[0m\e[33m}\e[0m\e[34m{\e[0m\e[35m[\e[0m\e[36m(\e[0m\e[36m)\e[0m\e[31m(\e[0m\e[31m)\e[0m\e[35m]\e[0m\e[32m(\e[0m\e[32m)\e[0m\e[34m}\e[0m"
  end

  def test_rainbow_code
    result = Parens.rainbow "(define (lambda (x) (add5 (+ 5 x)))"
    assert_equal result, "\e[31m(\e[0mdefine \e[32m(\e[0mlambda \e[33m(\e[0mx\e[33m)\e[0m \e[34m(\e[0madd5 \e[35m(\e[0m+ 5 x\e[35m)\e[0m\e[34m)\e[0m\e[32m)\e[0m"
  end
end
