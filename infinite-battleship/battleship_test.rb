#!/usr/bin/env ruby -w

require "minitest/autorun"
require "minitest/pride"

require "./battleship"

class BattleShipTest < Minitest::Test

  def setup
    @battleship = Battleship.new(:player1, :player2)
  end

  def test_players
    empty_board = {:player1 => [], :player2 => []}
    assert_equal empty_board, @battleship.board
  end

  def test_place_aircraft_north
    @battleship.place_ship!(:player1, 5, 1, :aircraft_carrier, :north)
    assert_equal [[:aircraft_carrier,
                  [p(5,1),
                   p(5,2),
                   p(5,3),
                   p(5,4),
                   p(5,5)]]],
                 @battleship.board[:player1]
  end

  def test_miss
    @battleship.place_ship! :player1, 5, 1, :aircraft_carrier, :north
    result = @battleship.fire! :player1, 0, 0
    assert_equal "Splash", result
  end

  def test_hit
    @battleship.place_ship! :player1, 5, 1, :aircraft_carrier, :north
    result = @battleship.fire! :player1, 5, 1
    assert_equal "Hit my aircraft carrier", result
  end

  def test_sink
    @battleship.place_ship! :player1, 5, 1, :aircraft_carrier, :north
    1.upto(4) do |i|
      result = @battleship.fire! :player1, 5, i
      assert_equal "Hit my aircraft carrier", result
    end
    result = @battleship.fire! :player1, 5, 5
    assert_equal "Sank my aircraft carrier", result
  end
end
