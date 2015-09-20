require_relative "dice.rb"
require_relative "dice_score.rb"
require_relative "chance_dice_score.rb"
require_relative "combo_dice_score.rb"
require_relative "kind_dice_score.rb"
require_relative "full_house_dice_score.rb"
require_relative "small_straight_dice_score.rb"
require_relative "large_straight_dice_score.rb"
require_relative "yahtzee_dice_score.rb"

class YahtzeeScore

  def score_classes
    [YahtzeeDiceScore,
     LargeStraightDiceScore,
     SmallStraightDiceScore,
     FullHouseDiceScore,
     KindDiceScore,
     ComboDiceScore,
     ChanceDiceScore]
  end

  def score dice
    score_classes.map do |score_class|
      dice_score = score_class.new dice
      if dice_score.applies?
        dice_score.score
      else
        0
      end
    end.max
  end

  def build_dice_score dice
    score_classes.map do |score_class|
      score_class.new dice
    end
  end
end
