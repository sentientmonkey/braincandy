class DiceScore
  attr_reader :dice

  def initialize dice
    @dice = dice
  end

  def score
    raise "Not Implemented"
  end

  private

  # helper functions
  # could refactor into mixins, but meh.

  def sum roll
    roll.reduce &:+
  end

  def roll_group
    dice.roll.group_by{|x| x }.values
  end

  def max_group
    roll_group.max {|a,b| a.length <=> b.length }
  end

  def straight_count
    last = nil
    count = 0
    max_count = 0
    dice.roll.each do |i|
      if i == last
        count += 1
      else
        if count > max_count
          max_count = count
        end
        count = 1
      end
      last = i
    end
    max_count
  end
end
