require_relative "dice_score.rb"

class KindDiceScore < DiceScore
  def score
    if roll_group.any? { |g| g.length >= 3 }
      sum dice.roll
    else
      0
    end
  end
end
