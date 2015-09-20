require_relative "dice_score.rb"

class KindDiceScore < DiceScore
  def applies?
    roll_group.any? { |g| g.length >= 3 }
  end

  def score
    sum dice.roll
  end
end
