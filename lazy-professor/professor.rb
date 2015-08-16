class Professor
  attr_reader :grades

  def initialize(filename)
    lines = File.readlines filename
    @grades = lines.map{ |line| line.chomp.each_char.to_a }
  end

  # Tallys and provides answer key based on grades.
  # Grades solely on propularity, and for ties, picks the first one.
  def answers
    grades.transpose.map do |question|
      question.each_with_object(Hash.new(0)) do |grade,totals|
        totals[grade] += 1
      end.max_by{|_,count| count}.first
    end.join ''
  end
end
