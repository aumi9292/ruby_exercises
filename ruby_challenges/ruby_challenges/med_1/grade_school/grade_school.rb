class School
  def initialize
    @school = Hash.new([])
  end

  def to_h
    school.each_value(&:sort!).sort.to_h
  end

  def add(name, grade)
    school[grade] += [name]
  end

  def grade(level)
    school[level]
  end

  private

  attr_reader :school
end
