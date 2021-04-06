# frozen_string_literal: false

arr = [1, 2, 3, 4]
final = []

length = 2

loop do
  arr.each_cons(length) { |set| final << set }
  length += 1
  break if length > arr.length
end
p final
# p arr.each_cons(3).to_a #=>

# all subs of at least length 2
final = []
0.upto(arr.length - 2) do |index|
  2.upto(arr.length - index) do |length|
    final << arr[index, length]
  end
end

p final

p arr.combination(2).to_a
puts
p arr.permutation(4).to_a.length
p arr.permutation(4).to_a
puts
p arr.permutation(2).to_a.length
p arr.permutation(2).to_a

arr = [1, 2, 3]
p arr.combination(2, &:sum).max

str = 'helloaaabbbcc'
ords = []
str.chars.combination(3) { |set| ords << set.map(&:ord) }
p ords.count { |arr| arr == arr.sort }

arr = %w[aabb dfdfdf frdesw lkjhgfdsahs aba cdedc]
# prob: iterate over array, select the strings that have the longest alpha streak concatenated to a new str
# iterate over array,
# at each word, find all substrings of that word,
# select max by the longest substring
# select the longest 2
# join them together

palindrome_subs = []
arr.each do |word|
  0.upto(word.length - 2) do |index|
    2.upto(word.length - index) do |length|
      palindrome_subs << word[index, length] if word[index, length] == word[index, length].reverse
    end
  end
end
p palindrome_subs

sentence_subs = []
string = 'hey bobby how are you doing today?'
string.split(' ').each do |word|
  substrings = []
  0.upto(word.length - 2) do |index|
    2.upto(word.length - index) do |length|
      substrings << word[index, length]
    end
  end
  sentence_subs << substrings
end

p sentence_subs

# You are given an array which contains only integers (positive and negative). Your job is to sum only the numbers that are the same and consecutive. The result should be one array.

# You can asume there is never an empty array and there will always be an integer.

# p sum_consecutives([1,4,4,4,0,4,3,3,1, 1]) == [1,12,0,4,6,2]
# p sum_consecutives([1,1,7,7,3]) == [2,14,3]
# p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]

# given an array of integers, sum each integer that is the same and consecutive. These sums, including inidividual positive numbers, should be returned in an array.
# rules: only sum numbers that are the same and consecutive
# individual numbers can be added to the array as well
# never be an empty array there will always be integers

# in: array of integers
# out: array of summed integers
# [1, 4, 4, 4, 0, 4, 3, 3, 1, 1] --- [1, 12, 0, 4, 6, 2] indexes 0, 1-3, 4, 5, 6-7, 8-9
# alg:
# init sets array
# 1. iterate over the given array
# if a number is not the same as the num at index + 1, push that number into consecutives set
# [1, ]
# if a number is the same as index - 1, final[-1] += num

# init final
# init sets
# from 0 to the length of the array -1, iterate over each num in the array
# from length 1 up to length of array minus the index, grab each possible set
# select only sets that are the same
# iterate over the given array, if the num is not included in the sets array, push the number to final
# if the number is included in the sets array, grab the length of the sub array it is in
# reassign the num to the return value of adding the num to itself the number of times equal to its length in the sets array of arrays

def sum_consecutives(arr)
  final = []
  arr.each_with_index do |num, i|
    final << num if arr[i + 1] != arr[i] && final[-1] != arr[i]
  end
  final
end

def sum_consecutives(arr)
  subs = []
  0.upto(arr.length - 1) do |index|
    1.upto(arr.length - index) do |length|
      subs << arr[index, length]
    end
  end
  subs.select { |set| set }
end

p sum_consecutives([1, 4, 4, 4, 0, 4, 3, 3, 1, 1]) #== [1, 12, 0, 4, 6, 2]
p sum_consecutives([1, 1, 7, 7, 3]) == [2, 14, 3]
p sum_consecutives([-5, -5, 7, 7, 12, 0]) == [-10, 14, 12, 0]

# advanced 1
# each inner array has a coordinate of 2 indexes-- 00, 01, 02-10, 11, 12--20, 21, 22
# coordinates must be flipped--[0, 1] must be [1, 0]
# init transposed arr, with default value of [[], [], []]
# iterate over each inner array, note this index outer_i = arr[0], arr[1], arr[2]
# within each inner array, iterate over each element--note this index inner_i = inner[0], inner[1], inner[2]

# move each element at arr[outer_i][inner_i] to the new array at [inner_i][outer_i]

# return new array

def transpose(arr)
  transposed = Array.new([[], [], []])
  arr.each_index do |outer_i|
    arr.each_index do |inner_i|
      transposed[inner_i][outer_i] = arr[outer_i][inner_i]
    end
  end
  transposed
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# easy 4
# take an array, return the same number of elements, with a running total of the sum of prior elements and the int at that element

# [2, 4, 13] -- [2, 7, 20]
# iterate over each int in the array
# at each int, add from arr[0] up to arr[i]--arr[0..i].sum
def running_total(arr)
  arr.map.with_index { |_int, i| arr[0..i].sum }
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

# easy 4
# given a string of digits, return the integer equivalent not using built in methods

# '4321' --- 4321

# create an arr of 1-10
# create a total at 0
# iterate over each char in the string
# grab each char, compare it to the array
# grab the index + 1 for each char,
# multiply that int by 1 * 10 to the i
# increment the total by this amount
# RETURN THE TOTAL

def string_to_signed_integer(str)
  arr = %w[0 1 2 3 4 5 6 7 8 9]
  sign = str.slice!(0) unless arr.include?(str[0])
  multiplier = sign == '-' && sign ? -1 : 1

  str.chars.reverse.map.with_index { |char, i| arr.index(char) * 10**i }.reduce(&:+) * multiplier
end

p string_to_signed_integer('4321') #== 4321
p string_to_signed_integer('570') == 570
p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

# easy 5
def ascii_value(str)
  str.chars.map(&:ord).sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
