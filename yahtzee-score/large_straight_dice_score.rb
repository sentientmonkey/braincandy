require_relative "dice_score.rb"

class LargeStraightDiceScore < DiceScore
  def applies?
    straight_count == 5
  end

  def score
    40
  end
end
