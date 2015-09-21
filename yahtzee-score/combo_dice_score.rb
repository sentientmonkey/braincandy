require_relative "dice_score.rb"

class ComboDiceScore < DiceScore
  def score
    sum max_group
  end
end
