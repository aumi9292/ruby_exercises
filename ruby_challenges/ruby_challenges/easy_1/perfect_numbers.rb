# a perfect number is == to the sum of its positive divisors
# positive divisors: the pairs of numbers whose product yields the target number
# exclusive, does not include the number itself, (so it includes 2...limit)

# test implications
# define a class PerfectNumber

# define a class method ::classify to take one argument
# raise a StandardError if arg is negative
# otherwise return a string object
# 'deficient' if all divisors summed < arg
# 'perfect' if all divisors summed == arg
# 'abundant' if all divisors summer > arg

# method implementation
# raise error if negative?
# iterate from 2.upto(arg - 1)
# if arg % int == 0, gather these numbers in an array
# sum this array of numbers

class PerfectNumber
  def self.classify(int)
    int.negative? ? raise(StandardError) : perfect_or_other(int)
  end

  class << self
    def perfect_or_other(int)
      compile_divisors(int) == int ? 'perfect' : less_or_greater(int)
    end

    def less_or_greater(int)
      compile_divisors(int) < int ? 'deficient' : 'abundant'
    end

    def compile_divisors(int)
      (1...int).select { |div| (int % div).zero? }.sum
    end
  end
end
