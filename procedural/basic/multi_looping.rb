# frozen_string_literal: true

# problem: given a string, return all substrings that can be made from that str
# in: str, out: str
# alg
# 1. init substrings array
# 1b. split given string into array of chars
# 2. iterate through each index in the array
# 3. for elements at each index, iterate from index to array.length - index

def substrings(str)
  subs = []
  chars = str.chars
  chars.each_index do |index|
    chars[index..(chars.length - index)].each_index do |i2|
      subs << chars[index, i2 + 1].join
    end
  end

  subs.select { |sub| sub.length > 1 }
end

def substrings2(str)
  subs = []
  chars = str.chars
  chars.each_index do |index|
    index2 = index + 1
    loop do
      subs << chars[index..index2].join
      index2 += 1
      break if index2 == chars.length
    end
    break if index == chars.length - 2
  end
  subs
end

p substrings2('halo') == %w[ha hal halo al alo lo] # => true


def substrings(number)
  sets = []
 numbers = number.digits.reverse 
   numbers.each_with_index do |num, idx|  
   substrings = numbers.permutation(idx + 1).to_a
    sets << substrings 
   end
   sets
end