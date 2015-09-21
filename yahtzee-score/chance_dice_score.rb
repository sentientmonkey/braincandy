require_relative "dice_score.rb"

class ChanceDiceScore < DiceScore
  def score
    sum dice.roll
  end
end
