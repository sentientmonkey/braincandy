class Dice
  attr_reader :roll

  def initialize *roll
    @roll = roll
  end

  def self.roll!
    self.new *Array.new(5) { rand(6) + 1 }
  end
end
