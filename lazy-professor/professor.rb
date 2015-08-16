class Professor
  attr_reader :grades, :totals

  # Tallys and provides answer key based on grades
  def initialize(filename)
    lines = File.readlines filename
    @grades = lines.map{ |line| line.chomp.each_char.to_a }.transpose
    @totals = Array.new(@grades.size){ Hash.new(0) }
    tally_answers
  end

  # Grades solely on propularity, and for ties, picks the first one.
  def answers
    totals.map{|question| question.max_by{ |_,count| count}.first }.join ''
  end

  private

  def tally_answers
    grades.each_with_index do |question,i|
      question.each do |grade|
        totals[i][grade] += 1
      end
    end
  end
end
