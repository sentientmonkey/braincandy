require_relative "dice_score.rb"

class ComboDiceScore < DiceScore
  def applies?
    max_group.length > 1
  end

  def score
    sum max_group
  end
end
