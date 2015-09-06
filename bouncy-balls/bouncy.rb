#!/usr/bin/env ruby -w

require "graphics"

class Ball < Graphics::Body
  def initialize w
    super
  end

  def draw
    w.circle x, y, 5, :red, true
  end
end

class BounceSimulation < Graphics::Simulation
  attr_accessor :balls

  def initialize
    super 640, 640, 16, "Bounce"
    self.balls = populate Ball, 1
    puts balls.inspect
  end

  def update n
  end

  def draw n
    clear
    balls.each(&:draw)
  end
end

BounceSimulation.new.run
