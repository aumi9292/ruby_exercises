# frozen_string_literal: true

# easy 1
# given a string and an integer, print the string as many times as specified by the int
def repeat(str, times)
  times.times { puts str }
end
repeat('Hello', 3)

def is_odd?(int)
  int.abs.odd?
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

def digit_list(int)
  int.digits.reverse
  int.to_s.split('').map(&:to_i)
end

puts digit_list(12_345) == [1, 2, 3, 4, 5] # => true
puts digit_list(7) == [7] # => true
puts digit_list(375_290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4] # => true

def array_count(arr)
  uniq_arr = arr.uniq
  final = uniq_arr.each_with_object({}) do |el, final|
    final[el] = arr.count(el)
  end
  final
end
vehicles = %w[
  car car truck car SUV truck
  motorcycle motorcycle car truck suv
]

p array_count(vehicles)

def reverse_sentence(sent)
  arr = sent.split(' ')
  arr.map.with_index { |_word, i| arr[-1 - i] }.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') #== 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

def reverse_words(sent)
  arr = sent.split(' ')
  final = arr.map.with_index do |word, _i|
    word.length > 5 ? word.reverse : word
  end
  final.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')

def string(int)
  final = ''
  int.downto(1) { |int| final += int.odd? ? '1' : '0' }
  final
end

p string(7)

def average(arr)
  total = arr.reduce(0) { |acc, curr| acc + curr }
  total / arr.length
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

def sum(int)
  int.digits.sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

# easy3 pal strings part 2
# given a string, return t or f depending on if the string is the same as it is reversed
# rules: ase insensitive, ignore non-alphanumerics
# alg
# downcase the str, reverse, compare
def real_palindrome?(str)
  str = str.chars.select { |char| ('a'..'z').include?(char.downcase) || (0..9).include?(char) }.join
  str.downcase == str.downcase.reverse
end
puts
p real_palindrome?('madam') #== true
p real_palindrome?('Madam') #== true # (case does not matter)
p real_palindrome?("Madam, I'm Adam") #== true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false

def multisum(_int)
  sum = 0
  1
end
p multisum(3) #== 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234_168

# .insert( index, ' ')

# Divisors of 42 are : 1, 2, 3, 6, 7, 14, 21, 42. These divisors squared are: 1, 4, 9, 36, 49, 196, 441, 1764. The sum of the squared divisors is 2500 which is 50 * 50, a square!

# Given two positive integers we want to find all integers between them whose sum of squared divisors is itself a square. 42 is such a number.

# The result will be an array of arrays, each subarray having two elements, first the number whose squared divisors is a square and then the sum of the squared divisors.

# p list_squared(1, 250) == [[1, 1], [42, 2500], [246, 84100]]
# p list_squared(42, 250) == [[42, 2500], [246, 84100]]
# p list_squared(250, 500) == [[287, 84100]]

# 5 kyu
# What is an anagram? Well, two words are anagrams of each other if they both contain the same letters. For example:

# 'abba' & 'baab' == true

# 'abba' & 'bbaa' == true

# 'abba' & 'abbba' == false

# 'abba' & 'abca' == false
# Write a function that will find all the anagrams of a word from a list. You will be given two inputs a word and an array with words. You should return an array of all the anagrams or an empty array if there are none. For example:
# =end

# problem: given a word and an array of words, return a new array of words that are anagrams of the given word
# rules: return an empty array if there are no anagrams

# alg
# iterate over the array of words,
# select words that have the same counts of each character in teh given word
# wrd_arr = ['a', 'b', 'b', 'a']
# compare word = ['a', 'a', 'b', 'b']
# word.count(char) == arr_word.count(char)

def anagrams(word, arr)
  word_arr = word.chars
  final = arr.select do |test_word|
    compare_word = test_word.chars
    compare_word.all? do |char|
      word_arr.count(char) == compare_word.count(char)
    end
  end
  final
end

p anagrams('abba', %w[aabb abcd bbaa dada]) #== %w[aabb bbaa]
p anagrams('racer', %w[crazer carer racar caers racer]) == %w[carer racer]
p anagrams('laser', %w[lazing lazy lacer]) == []

def prime?(num)
  (num - 1).downto(2).none? { |div| num % div == 0 }
end

p prime?(10)
p prime?(17)
p prime?(191)
p prime?(193)

def comp(array1, array2)
  p array1, array2
  return false unless array1 && array2 && array1.length >= 1 && array2.length >= 1

  least, most = [array1, array2].minmax_by(&:sum)
  p squared = least.map { |num| num**2 }
  p squared.sum == most.sum
end

p comp([4, 4], [1, 31])

def multisum(int)
  3.upto(int).select { |num| num % 5 == 0 || num % 3 == 0 }.sum
end

p multisum(20)

def group_and_count(input)
  final = Hash.new(0)
  p final
  input.each { |el| hash[el] += 1 }
  final
end

# p group_and_count([0, 1, 1, 0])
hsh = { 1 => 10, 2 => 11 }
p hsh[1] += 1
