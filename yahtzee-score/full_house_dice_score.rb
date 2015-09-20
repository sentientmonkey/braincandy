require_relative "dice_score.rb"

class FullHouseDiceScore < DiceScore
  def applies?
    roll_group.length == 2
  end

  def score
    25
  end
end
