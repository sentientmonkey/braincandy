#!/usr/bin/env ruby -w

Position = Struct.new(:x, :y, :hit) do
  def hit!
    self.hit = true
  end
end

def p x, y
  Position.new x, y, false
end

class Battleship
  attr_reader :board
  SHIPS = {aircraft_carrier: 5,
           battleship: 4,
           destroyer: 3,
           patrol_boat: 2}

  DIRECTIONS = {north: [0,1],
                south: [0,-1],
                east:  [1,0],
                west:  [-1,0]}

  def initialize *players
    @board = Hash[players.map {|p| [p, []] }]
  end

  def place_ship! player, x, y, name, direction
    x1, y1 = DIRECTIONS[direction]
    positions = SHIPS[name].times.map do |i|
      p(x+x1, y+(y1*i))
    end
    board[player] << [name, positions]
  end

  def fire! player, x, y
    result = :miss
    hit_ship = nil
    board[player].each do |ship|
      name, positions = ship
      positions.each do |pos|
        if pos.x == x && pos.y == y && !pos.hit
          pos.hit!
          hit_ship = name
          if positions.all? {|p| p.hit == true }
            result = :sank
          else
            result = :hit
          end
        end
      end
    end
    message result, hit_ship
  end

  def message action, name
    case action
    when :miss
      "Splash"
    when :hit
      "Hit my #{ship_name name}"
    when :sank
      "Sank my #{ship_name name}"
    end
  end

  def ship_name sym
    sym.to_s.gsub "_", " "
  end
end
