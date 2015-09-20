require_relative "dice_score.rb"

class SmallStraightDiceScore < DiceScore
  def applies?
    straight_count == 4
  end

  def score
    30
  end
end
