# create a clock--should be able to add and subtract minutes to it
# clocks of the same time should be equal to each other (== must be defined to compare time values)

# tests
# define a class Clock
# define a Clock::at method to take 1 or 2 arguments--1st arg should be the hour, second arg should be minutes and default to 00

class Clock
  def self.at(hour, min = 0)
    Clock.new(hour, min)
  end

  def initialize(hour, min)
    @hour = hour
    @min = min
  end

  def +(to_add)
    total = min + to_add
    total >= 60 ? calculate_added(to_add, total) : self.min += to_add
    to_s
  end

  def -(to_sub)
    min - to_sub <= 0 ? calculate_subbed(to_sub) : self.min -= to_sub
    to_s
  end

  def ==(other)
    min == other.min && hour == other.hour
  end

  def to_s
    format_zeros(hour, min).join(":")
  end

  protected

  attr_reader :min, :hour

  private

  attr_writer :min, :hour

  def format_zeros(*times)
    times.map { |tm| (0..9).cover?(tm) ? "0#{tm}" : tm.to_s }
  end

  def calculate_added(to_add, total_mins)
    self.hour += (total_mins / 60)
    self.hour -= 24 if hour >= 24
    self.min += (to_add - 60)
  end

  def calculate_subbed(to_sub)
    hours_to_sub = (to_sub / 60.0).ceil
    mins_to_sub = to_sub - (hours_to_sub * 60)
    self.hour -= hours_to_sub
    self.hour += 24 if hour <= 0
    self.min -= mins_to_sub
  end
end
