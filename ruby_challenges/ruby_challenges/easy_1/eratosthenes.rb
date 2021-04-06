# problem: use the sieve of eratosthenes algorithm to out put all prime numbers given a starting and ending number (inclusive).

# test implications
# define a Sieve class
# define an initialize method that takes 1 argument--the upper limit of the range to check

# define a Sieve#primes method that takes no arguments. It should return an array of all prime numbers between 2 and the upper limit instance variable of the calling Sieve object.

# algorithm:
# create an array of integers from 2 upto the range limit [2, 3, 4, 5, 6,, 7, 8, 9, 10]
# create a final empty array []
# starting with 2--divide the upper limit by the int  -- 10 / 2 = 5
# from that divisor down to 2, remove the int * divisor from the original array and place into a final array 5 * 2, 4 * 2, 3 * 2, 2 * 2
# continue checking until the original array is empty (guard clause)

class Sieve
  def initialize(upper)
    @upper = upper
  end

  def primes
    range = (2..upper).to_a
    range.each_with_object([]) do |int, final|
      break if range.empty?
      final << int
      current_upper = range.max
      int.upto(current_upper / int) { |div| range.delete(int * div) }
    end
  end

  private

  attr_reader :upper
end
