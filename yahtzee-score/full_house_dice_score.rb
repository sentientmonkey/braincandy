require_relative "dice_score.rb"

class FullHouseDiceScore < DiceScore
  def score
    if roll_group.length == 2
      25
    else
      0
    end
  end
end
