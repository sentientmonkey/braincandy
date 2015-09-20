require_relative "dice_score.rb"

class ChanceDiceScore < DiceScore
  def applies?
    true
  end

  def score
    sum dice.roll
  end
end
