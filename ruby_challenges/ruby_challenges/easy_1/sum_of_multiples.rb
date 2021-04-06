# write a program that will sum all multiples of given or default input from 2 upto but not including the argument given to the method

# test implications
# define a class SumOfMultiples

# define a constant DEFAULT--an array with 3, 5

# define an initialize method that takes a splat argument of integers
# set @multiples to the array of integers

# define a class method ::to
# takes 1 argument, the exlusive upper limit of the range to check
# returns all multiples of 3 or 5 bw 2 and 1 - upper limit, summed

# define an instance method #to--takes an argument of upper_limit
# from the smallest int upto the given upper_limit argument (exclusive)
# select integers where integer % multiple == 0
# do this for each integer in the #multiples array

class SumOfMultiples
  def self.to(upper)
    (2...upper).select { |int| (int % 3).zero? || (int % 5).zero? }.sum
  end

  def initialize(*multiples)
    @multiples = multiples
  end

  def to(upper)
    (2...upper).select { |int| multiples.any? { |m| (int % m).zero? } }.sum
  end

  private

  attr_reader :multiples
end
