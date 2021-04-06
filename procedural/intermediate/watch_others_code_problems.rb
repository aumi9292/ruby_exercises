# frozen_string_literal: true

# part 1
# problem: given an integer, determine if it is a prime number
# in: int, out: boolean t or f
# rules: prime numbers are only divisible by the number itself and 1
# alg
# from 2 up to the int minus 1, check each number to see if the int % number == 0
# if yes, end execution, return true
# else false
# 10 (2)--10 % 2 == 0, return true

def prime?(int)
  return false if int <= 1
  return true if int == 2

  2.upto(int - 1) do |divisor|
    return false if int % divisor == 0
  end
  true
end

p prime?(10) == false
p prime?(3) == true
p prime?(4) == false

def select_primes(arr)
  arr.select { |el| prime?(el) }
end

p select_primes([1, 2, 3, 4]) == [2, 3]
p select_primes([4, 6, 8, 10])

def count_primes(arr)
  arr.count { |el| prime?(el) }
end

p count_primes([1, 2, 3, 4]) == 2
p count_primes([4, 6, 8, 10]) == 0

def user_add_mult
  puts 'Enter a number greater than 0: '
  num = gets.chomp.to_i
  puts 'A or M ?'
  operation = gets.chomp.upcase
  total = 0
  if operation == 'A'
    total = 0
    num.downto(1) { |i| total += i }
  else
    total = 1
    num.downto(1) { |i| total *= i }
  end
  puts "total: #{total}"
end

# user_add_mult

# interleave
def interleave(a1, a2)
  final = []
  a1.each_with_index do |_el, i|
    final << a1[i] << a2[i]
  end
  final
end

p interleave([1, 2, 3], %w[a b c]) #== [1, 'a', 2, 'b', 3, 'c']

# part 2
# p1
# problem: write a method that will return a substring based on specified indices

# alg: access the substring using the two args as starting and ending index
def substring(str, start, ending = start)
  str[start..ending]
end

p substring('hello', 0, 2) == 'hel'
p substring('honey', 1, 2) #== "on"
p substring('honey', 3, 9) #== "ey"
p substring('honey', 2)    #== "n"

# prob: return all substrings that are 2 or more letters in a string
def substrings(str)
  final = []
  0.upto(str.length - 2) do |index|
    2.upto(str.length - index) do |length|
      final << str[index, length]
    end
  end
  final
end
# pedac description:
# use integers 0 up to the length of the string minus 2 to access integers that will represent the index of the collection
# use integers 2 up to the length of the string minus the current value of the index to obtain an integer that will represent the length of the collection
# use the index and the length to specify the substring from the string, push this substring into an array

p substrings('band') == %w[ba ban band an and nd]
p substrings('world') == %w[wo wor worl world or orl orld rl rld ld]
p substrings('ppop') == %w[pp ppo ppop po pop op]

# problem 3
# Write a method that will return all palindromes within a string.
# prob: return all palindrome substrings from a string
# in: string, #out: array of strings

# alg
# init final array
# iterate over each char in the string
# at each char, access each string from that char up to the length of the array minus 2
# for each char, incremement a length variable from 2 to the length of the array minus the index
# push each substring to final array
# select only those that are the same forward and backward
# select the maximum length substring

# implementation
# init final variable
# 1. from 0 up to the length of the string minus 2, use each integer to access the indexes of each string
# 2. from 2 up to the length of the string minus the index, use each integer to rep the length of the substring
# 3. use the index and length to access substrings of each length at each character of the string
# 4. push each substring to a final collection
# 5. select only substrings that equal the substring reversed
# 6. select the substring of maximum length

def palindromes(str)
  final = []
  0.upto(str.length - 2) do |index|
    2.upto(str.length - index) do |length|
      final << str[index, length]
    end
  end
  final.select { |el| el == el.reverse }.max_by(&:length)
end
p palindromes('ppop') #== %w[pp pop]
