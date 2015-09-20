require_relative "dice.rb"

class YahtzeeScore
  def score dice
    if yahtzee? dice
      50
    elsif large_straight? dice
      40
    elsif small_straight? dice
      30
    elsif full_house? dice
      25
    elsif three_or_four_of_a_kind? dice
      sum dice.roll
    elsif combo? dice
      sum max_group dice
    else # chance
      sum dice.roll
    end
  end

  def sum roll
    roll.reduce &:+
  end

  def max_group dice
    roll_group(dice).max {|a,b| a.length <=> b.length }
  end

  def straight_count roll
    last = nil
    count = 0
    max_count = 0
    roll.each do |i|
      if i == last
        count += 1
      else
        if count > max_count
          max_count = count
        end
        count = 1
      end
      last = i
    end
    max_count
  end

  def roll_group dice
    dice.roll.group_by{|x| x }.values
  end

  def yahtzee? dice
    roll_group(dice).length == 1
  end

  def large_straight? dice
    straight_count(dice.roll) == 5
  end

  def small_straight? dice
    straight_count(dice.roll) == 4
  end

  def full_house? dice
    roll_group(dice).length == 2
  end

  def three_or_four_of_a_kind? dice
    roll_group(dice).any? { |g| g.length >= 3 }
  end

  def combo? dice
    max_group(dice).length > 1
  end
end
