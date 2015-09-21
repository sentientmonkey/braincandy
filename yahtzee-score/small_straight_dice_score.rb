require_relative "dice_score.rb"

class SmallStraightDiceScore < DiceScore
  def score
    if straight_count == 4
      30
    else
      0
    end
  end
end
