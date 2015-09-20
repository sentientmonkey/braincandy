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
  def score dice
    if YahtzeeDiceScore.new(dice).applies?
      YahtzeeDiceScore.new(dice).score
    elsif LargeStraightDiceScore.new(dice).applies?
      LargeStraightDiceScore.new(dice).score
    elsif SmallStraightDiceScore.new(dice).applies?
      SmallStraightDiceScore.new(dice).score
    elsif FullHouseDiceScore.new(dice).applies?
      FullHouseDiceScore.new(dice).score
    elsif KindDiceScore.new(dice).applies?
      KindDiceScore.new(dice).score
    elsif ComboDiceScore.new(dice).applies?
      ComboDiceScore.new(dice).score
    else # chance
      ChanceDiceScore.new(dice).score
    end
  end
end
