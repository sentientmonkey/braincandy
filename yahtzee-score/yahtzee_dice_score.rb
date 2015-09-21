require_relative "dice_score"

class YahtzeeDiceScore < DiceScore
  def score
    if roll_group.length == 1
      50
    else
      0
    end
  end
end
