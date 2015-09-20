require_relative "dice_score"

class YahtzeeDiceScore < DiceScore
  def applies?
    roll_group.length == 1
  end

  def score
    50
  end
end
