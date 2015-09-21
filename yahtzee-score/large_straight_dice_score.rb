require_relative "dice_score.rb"

class LargeStraightDiceScore < DiceScore
  def score
    if straight_count == 5
      40
    else
      0
    end
  end
end
