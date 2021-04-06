# Define a class Meetup with a constructor taking a month and a year
# and a method day(weekday, schedule)
# where weekday is one of :monday, :tuesday, etc
# and schedule is :first, :second, :third, :fourth, :last or :teenth.

# problem: 7 days that end in "eenth"
# each day of the week (mon, tue, wed, thur, fri, sat, sun) (7 days) all have 0ne date that is named with 'teenth' in every month
# questions: what are days that end it "teenth"? Are they the dates of the meetups?
# test suite irb
# Date.civil(2013, 5, 13).yday --> 133
# Date.civil(2013, 8, 19).yday --> 231

# teenth: first day in a week that "starts" with 10
# teenth days can still be first, second, third, fourth, or last
# fourth days can be either the fifth day of that month or the fourth day of that month

# figure out how to count the number of days (like mondays, tues, etc.s) that occur in each month
# label each 1st -

# new meetup in may 2013
# day method to take a day of the week, a label
# returns a civil Date object of the exact date--2013, 5, 13

# use the month given to Meetup::new
# iterate 1 day at a time from the first day to the final day of the month (until month = month + 1)
# instantiate a new date object for each day of that month
# have a hash with each day of the week (mon, tue, wed, thur, fri, sat, sun) (maybe with default value of [])
# at each day, push into the hash as an element of the array that is a value of the weekday key mon => [Date (1. 3. 13), Date (1. 10, 13), etc.]
# use the Symbol object of the weekday to select the list of possible dates
# use supporting methods to
# return the Date object based on its index (1st, 2nd, 3rd, 4th)
# as well as based on if it is the final specified weekday of the month (:last) (sometimes 4th, sometimes 5th)
# return the Date object called :teenth, if that date object falls bw 10-19.
require 'date'

class Meetup
  NUMS = [:first, :second, :third, :fourth]

  def initialize(mo, yr)
    @mo = mo
    @yr = yr
    @sorted = {
      monday: [],
      tuesday: [],
      wednesday: [],
      thursday: [],
      friday: [],
      saturday: [],
      sunday: []
    }
  end

  def numeric(wday, mqual)
    idx = NUMS.index(mqual)
    @sorted[wday][idx]
  end

  def day(wday, mqual)
    start_of_month.step(end_of_month) { |day| sort_by_day_of_week(day) }
    select_date(wday, mqual)
  end

  private

  attr_accessor :mo, :yr, :sorted

  def start_of_month
    ::Date.civil(yr, mo, 1)
  end

  def end_of_month
    ::Date.civil(yr, mo, -1)
  end

  def select_date(wday, mqual)
    NUMS.include?(mqual) ? numeric(wday, mqual) : last_or_teenth(mqual, wday)
  end

  def last_or_teenth(mqual, wday)
    mqual == :teenth ? parse_teenth(wday) : @sorted[wday].last
  end

  def parse_teenth(wday)
    @sorted[wday].find { |day| day.mday.between?(13, 19) }
  end

  def sort_by_day_of_week(date)
    dow = date.strftime("%A").downcase.to_sym
    sorted[dow] << date
  end
end
