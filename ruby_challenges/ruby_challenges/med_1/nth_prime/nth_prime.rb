#write a program to tell you what the nth prime is. Given an integer representing the number of the prime in the sequence, return the prime number that is at that position in the sequence

class Prime 
  def self.nth(position)
    raise ArgumentError if position.zero?
    prime_pos(position)
  end 

  def self.prime_pos(pos)
    primes = []
    int = 2 
    loop do 
      primes << int if prime?(int)
      int += 1 
      break if primes.length == pos 
    end 
    primes.last
  end

  def self.prime?(int)
    (2..Math.sqrt(int)).none? { |div| (int % div).zero? }
  end 
end 

=begin James Duot's crazy solution 
class Prime
  def self.nth(nth)
    raise ArgumentError if nth < 1

    prime_p = ->(n) { (2..Math.sqrt(n).to_i).none? { |d| (n % d).zero? } }
    (2..Float::INFINITY).lazy.select(&prime_p).each.with_index(1)
                        .find { |_prime, index| index == nth }
                        .first
  end
end
=end 
