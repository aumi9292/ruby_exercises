# frozen_string_literal: true

require 'pry'

def fizzbuzz(int1, int2)
  int1.upto(int2) do |counter|
    output = if counter % 5 == 0 && counter % 3 == 0
               'Fizzbuzz'
             elsif counter % 5 == 0
               'Buzz'
             elsif counter % 3 == 0
               'Fizz'
             else
               counter
     end
    puts output
  end
end

fizzbuzz(1, 100)

arr = *(1..10)
p arr

def decode(key_and_encrypted)
  encoded = []
  key = []
  alphabet = ('a'..'z').to_a
  decoded_letters = []

  key_and_encrypted.split('').each do |char|
    encoded << char if char.downcase != char.upcase
    key << char if char.to_i.to_s == char
  end

  key = key.join.to_i
  encoded_indexes = encoded.map { |char| alphabet.index(char) }

  encoded_indexes.each do |encoded_index|
    alphabet.each_with_index do |char, index|
      decoded_letters << char if index * key % alphabet.length == encoded_index
    end
  end

  return 'Impossible to decode' unless decoded_letters.length == encoded_indexes.length

  decoded_letters.join
end

decode('6015ekx')

# code with conrad
# 1. write a method that takes an array of strings, return an array of the same string values, except with vowels removed
# in: array of strings out: array of strings
# alg
# 1. iterate over strings, map new str
# 2. delete vowels from each str

def no_vowels(array)
  array.map { |word| word.gsub(/[aeiouAEIOU]/, '') }
end

p no_vowels(%w[green yellow blue red])

# 2. write a method that takes a string, returns a boolean indicating whether the string has balanced parantheses
# rules: str can have no parentheses, if lpar, rpar must be present
# alg:
# convert the string to an array of chars
# select from this array '(' and ')'
# check if '(' comes before ')' and the total is even
def balanced?(str)
  pars = str.chars.select { |char| ['(', ')'].include?(char) }
  pars.length.even? && pars.index('(') < pars.index(')')
end

p balanced?('(hello there)(')

# find primes
# problem: given two integers, return an array of integers between those two that are prime numbers
# edge cases: inclusive of boundary integers
# alg
# create an array of int1 to int2
# select all els that are prime numbers
# check if num is a prime number--
# given int, return boolean
# create an array of all ints from 2 to int
# iterate through that array, return false if int / num == 0

def find_primes(int1, int2)
  nums = (int1..int2).to_a
  nums.select { |num| is_prime?(num) }
end

def is_prime?(int)
  return false if int <= 1

  ints = (2..(int - 1)).to_a
  ints.none? { |num| int % num == 0 }
end

p find_primes(3, 100)

p is_prime?(7)

# watch others code--pt 1
# problem: given a string, check if it can be constructed by taking a substring of it and seeing if that substring can be appended multiple times to recreate the original string.
# rules: chars will only be lowercase english chars, string will be non-empty, the substring can be any length that can be multiplied to equal the length of the string--at most, the substring can be half the length of the given string, at least, it can be 2 or 3 chars--substrings must be at least two characters

# algorithm
# 1. check if string from start to halfway is equal to halfway to end
def repeated_sub_pattern(str)
  smallest_str = smallest_str(str)
  multiplied = str.length / smallest_str
  str[0...smallest_str] * multiplied == str
end

def smallest_str(str)
  i = 2
  loop do
    return i if str.length % i == 0

    i += 1
  end
  i
end

p repeated_sub_pattern('abababa')

# given an array of strings made from lowercase letters, return an array of all the characters that show up across strings, including the duplicates.
# in: array of strings, out: array of individual character strings

# rules: each letter in each string must be examined--if each of the other strings includes that character, add that character to the final array
# return an empty array if no characters match across all strings
# algorithm
# init final array
# 1. iterate over array, examining each string
# 2. split each string to examine each letter
# 3. if each of the other strings at different indexes of the array include that char, push it to the commons final array

def common_chars(array)
  commons = []
  array.first.chars.each do |char|
    if arr_includes_char?(char, array) && array.all? { |word| word.count(char) == array.first.count(char) }
      commons << char
    end
  end
  commons
end

def arr_includes_char?(char, arr)
  strings_include_char = arr.select { |string| string.include?(char) }
  strings_include_char.length == arr.length
end

p common_chars(%w[hellhoo toohere phoopp hosilot])

#
# def common_chars(array)
#   first_word_chars = array.shift.chars

#   first_word_chars.select do |char|
#     #array.all? {|word| word.sub!(char, '')}
#     array.all? {|word| word.count(char) > 0 }
#   end
# end

# watch others code pt 2
# given an integer, return the next largest integer as the result of mixing up the digits in the original integer
# in: int, out: rearranged int
# rules: only return the next largest int, not the absolute largest (start at the lowest place)
# return -1 if the integer has no variations that are larger than the original
# alg: 1. split the integer into an array of integers
# 2. check if the ones int is larger than the 10s int, if it is, flip the two numbers
# 3. if it's not, check if the tens int is larger than the 100s int, if it is, flip the 2 numbers
# . keep doing this for each place, until the lower place digit is higher, or until all have been tried.
# 5. if all have been tried and none of the lowers are larger than the highers, return -1
# 6. otherwise, flip the lowest digit, join back to int, return int

def next_bigger_num(int)
  largest_num = int.digits.sort { |a, b| b <=> a }.join.to_i
  return -1 if int == largest_num || int < 10

  int.upto(largest_num) do |num|
    return num if int.digits.sort == num.digits.sort && num > int
  end
end

p next_bigger_num(2017)

# part 3 jacob

def max_sequence(arr)
  sum = 0
  set_size = 1
  loop do
    arr.each_cons(set_size) do |set|
      sum = set.sum if set.sum > sum
    end
    set_size += 1
    break if set_size > arr.length
  end
  sum < 1 ? 0 : sum
end

p max_sequence([-2, 4, -3, 5])
p max_sequence([11])
p max_sequence([-32])
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4])
p max_sequence([1, 5, 10])
# problem: given an array of integers, return the sub array with the largest sum
# in: array, out: arr (that is a subset of selecting a particular sub-array from the original array)
# rules: if all numbers are positive, return the sum of the whole array. if an array is empty or all els are negative, return 0
# approach: iterate over the array. at each element, add the sums of arr[0], arr[0..1], arr[0..2], till the end, to an array called sums. return the max of the sums array to an array called max_sums_at_each_index. return the max of max_sums, unless it's < 0
# algorithm:
# 1. init sum variable to 0
# 2. iterate over given array, adding together the elements from the current element in iteration and incrementing to the end
# 2a. init counter variable and assign to value of 1 (smallest possible combo)
# 3. init loop
# 3a. in the loop, access each set of consecutive numbers (from 1 up to the length of the array)
# 3b. sum each set of these numbers
# 4. increment counter
# 5. break when counter > length of the array
# 6. set the largest sum to the sum value
# if the largest variable is less than 1, return 0

# jacob #2 problem
# problem: given an array of strings that are made of all lowercase letters a-z, return the longest shared start between the strings. if there are no characters in common, return an empty string. if the strings are fully equal, return the full string
# in: array of strings, out: string
# algorithm:
# 1. associate all elements of the array together to create a nested array structure with inner elements of three characters at the same index of each eleemnt
# 2. check the inner arrays, return the max index of inner arrays that are all equal
# 3. using the first element, use bracket syntax to access from 0 to the max index to return that string

# alg
# 1. init a return string
# 2. init chars_at_indexes array
# 3. iterate over the given array
# 4. at each element, access the current letter and push that to the chars_at_indexes array, as its own inner array
# index = 0
# init loop at each char
# index += 1
# break if index == array.first.length
# 5. iterate over inner arrays
# 6. if all chars are equal to the corresponding char in the first arr element, add this char to the return string
# 7. break on the first iteration where not all els are equal

# def common_prefix(arr)
#   final = ''
#   chars_at_indexes = []
#   arr.each do |str|

# end

# p common_prefix(%w[flower florid flight])

# drafting for other problems
# def solve(string)
#   string.scan(/[aeiouAEIOU]+/).max_by(&:length).length
# end

# p solve('chrononhotonthuooaos')

# def solve(s)
#   int_arr = s.split('').map(&:to_i)
#   substrings = []
#   counter = 1
#   loop do
#     int_arr.each_cons(counter) do |subs|
#       substrings << subs
#       counter += 1
#       break if counter > int_arr.length
#     end
#   end
#   p substrings
# end

# p solve('1341')

# video 4: amanda
# problem 1: given two strings, return a boolean t or f if the two strings share a substring
# in: st1, st2
# out: boolean t or f
# rules: subs must be > 2 chars, case does not matter
# alg:
# 1. init arr for subs of st1
# 2. init arr for subs of st2
# 3. iterate over st1 chars--add st1 chars from 0-1, 0-2, 0-3, etc. until the length of the array--to st1_subs
# . init index at 1
# . init loop
# . use the index with bracket syntax to access str substring from 0 to index
# . increment index
# . break if index == length of the arr
# 4. repeat 3 for st2
# 5. iterate over 1st array of subs
# . check if subs2 include any elements from the 1st arr

def substring_test(st1, st2)
  subs_st1 = []
  subs_st2 = []
  sub_length = 2

  loop do
    st1.downcase.chars.each_cons(sub_length) { |cons| subs_st1 << cons }
    sub_length += 1
    break if sub_length > st1.size
  end

  sub_length = 2

  loop do
    st2.downcase.chars.each_cons(sub_length) { |cons| subs_st2 << cons }
    sub_length += 1
    break if sub_length > st2.size
  end

  subs_st1.any? { |substr| subs_st2.include?(substr) }
end

p substring_test('BANANA', 'banana')
p substring_test('BANANA', 'banana')
p substring_test('test', 'lllt')

# p2: problem: write a method scramble. given two strings, return t or f if a portion of st1 chars can be rearranged to match st2
# in: st1, st2, out: boolean
# rules: the first word must, in some order, contain all characters of the second word
# only lowercase a-z will be included, no punctuation or digits
# alg
# 1. split both strings into arrays of chars
# 2. iterate over the second_str array. check each el to see if 1st_str array includes it
# 3. map those return booleans to the 2nd str array
# 4. check this array to see if all values are true

def scramble(st1, st2)
  st1_arr = st1.chars
  st2_arr = st2.chars
  st2_arr.all? { |char| st1_arr.count(char) >= st2.count(char) }
end

p scramble('rkqodlww', 'world')
p scramble('katas', 'steak')
p scramble('javaass', 'jjss')

# video 5: Chris
# p1: problem: given a string, find the length of the longest substring that is the same when it is reversed
# in: string: out: integer representing the length of the longest palindromic substring
# rules: if given empty string, return 0
# alg:

# 1. split string into array of chars
# 1a. init empty array for substrings

# 4. iterate over each char in the array--remove this step
# 2. init length variable, assign to 1
# 5. init loop
# 6. at each element, check each consecutive set from 1 to the length of the array
# 6. add each of these sets to an array of substrings
# 7. increment length
# 8. break if length is equal to the length of the array

# iterate through the substrings array
# select inner arrays that are palindromes
# call max-by on the selected array, specify length

def longest_palindrome(str)
  return 0 if str.empty?

  arr = str.chars
  substrings = []
  length = 1
  loop do
    arr.each_cons(length) { |set| substrings << set }
    length += 1
    break if length > arr.length
  end
  substrings.select { |set| set == set.reverse }.max_by(&:length).length
  p substrings
end

p longest_palindrome('baabcd')
p longest_palindrome('baablkj12345432133d')
p longest_palindrome('')

def substrings(string)
  arr = []
  0.upto(string.length - 1) do |index|
    (string.length - 1).downto(index) do |end_index|
      arr << string[index..end_index]
    end
  end
  arr
end

p substrings('abcd')

def substrings2(string)
  arr = string.chars
  substrings = []
  length = 1
  loop do
    arr.each_cons(length) { |set| substrings << set }
    length += 1
    break if length > arr.length
  end
  substrings
end

p substrings2('abcd')

# video 6 andrew
# p1: problem: given an array of integers, return an integer that represents the index of where the sum of elements to the left is equal to the sum of elements to the right.
# rules: return -1 if there is no index for which the sum of l and r is equal
# algorithm
# 1. starting at the second element (bc the first element can never be chosen), check if the sum of elements up to and not including this middle index, and then elements after the index to the end of the array, are equal
# at the first index, the left will not be a sum, it will just be one number
# at index -2, the right will not be a sum, it will just be one number
# 2. if these sets are never equal, return -1

def find_even_index(arr)
  middle_index = 0

  loop do
    left_set = arr[0...middle_index]
    right_set = arr[(middle_index + 1)..arr.length - 1]

    return middle_index if left_set.sum == right_set.sum

    middle_index += 1
    break if middle_index == arr.length
  end
  -1
end

def find_even_index(arr)
  0.upto(arr.length - 1) do |middle_index|
    left_set = arr[0...middle_index]
    right_set = arr[(middle_index + 1)..arr.length - 1]
    return middle_index if left_set.sum == right_set.sum
  end
  -1
end

p find_even_index([1, 2, 3, 4, 3, 2, 1])
p find_even_index([10, -80, 10, 10, 15, 35, 20])
p find_even_index([1, 100, 2, 3, 4])

# julius article
# problem: Given a string, return the string with all consective duplicate characters collapsed into one character
# 'The booming doggie ran funnily' => 'The boming dogie ran funily'
# in: string, out: condensed new string
# algorithm:
# 1. break string into array of chars
# 1a. init final empty arr
# 2. iterate over array of chars, noting the index
# 3. add each char to the final arr, unless char == final.last
# 4. join the final array, return

def cust_squeeze(str)
  final = []
  arr = str.chars
  arr.each { |char| final << char unless final.last == char }
  final.join
end

p cust_squeeze('The booming doggies ran funnnily across the field.')

# #study group 7.16 problem
# Given a string of words, you need to find the highest scoring word.

# Each letter of a word scores points according to it's position in the alphabet:
# a = 1, b = 2, c = 3 etc.

# You need to return the highest scoring word as a string.

# If two words score the same, return the word that appears earliest in the original string.

# All letters will be lowercase and all inputs will be valid.

# problem: given a string, return the substring with the highest value letters
# in: string out: string
# rules: if 2 have the same value, return the first (use find)

# alg
# init array for alpha
# split string into array of words
# map over that array of words,
# for each word, iterate over each character
# obtain the index of that char in the alphabet, map that over each char
# reduce the integers to one summed int
# find the largest one

def alphabet_score(string)
  alpha = ('a'..'z').to_a

  words_with_points = string.split(' ').map { |word| [word.chars.map { |char| alpha.index(char) + 1 }.sum, word] }
  words_with_points.max_by { |inner| inner[0] }.last
end

p alphabet_score('man i need a taxi up to ubud') #== 'taxi'
p alphabet_score('what time are we climbing up the volcano') == 'volcano'
p alphabet_score('take me to semynak') == 'semynak'
p alphabet_score('aa b') == 'aa'

# Write a method that takes a string as an argument and groups the number of times each character appears in the string as a hash sorted by the highest number of occurrences.
#
# The characters should be sorted alphabetically e.g:
#
# get_char_count("cba") => {1=>["a", "b", "c"], 2 => ['d']}
# You should ignore spaces, special characters and count uppercase letters as lowercase ones.
#
# problem: given a string, return a hash with the counts of chars as values pointing to an array of the characters that have that count.
# input: string  #output: hash
# rules: spaces are ignored, special chars are ignored
#   #uppercase letters should be counted as lowercase letters
#
# algorithm
#   #a. initialize a final hash
#   #b. downcase the input string
#   #1. split the string into an array of characters
#     #1b. iterate over string to select only characters that are a-z or 1-9
#       (check if ('a'..'z') includes character or 1..9 . includes char, select only these
#   #2. iterate over each character--at each character, check the count of that character in the string
#     #3. compare the count of the character to see if it is a key in the final hash---check the final hash to see if the count is a key in it
#     #4. if it is, add the character to the array that that key is pointing to
#       4b. if it is not, add the count to the hash as a key, and push that character to the array that it points to
#   5. return the final hash
#

# def get_char_count(string)
#   final = {}
#   string = string.downcase
#   chars = string.chars.select { |char| ('a'..'z').include?(char) || (1..9).include?(char.to_i) }

#   chars.each do |char|
#     if final.key?(chars.count(char))
#       final[chars.count(char)] << char unless final[chars.count(char)].include?(char)
#     else
#       final[chars.count(char)] = [char]
#     end
#   end
#   final.map { |k, v| [k, v.sort] }.to_h.sort.reverse.to_h
# end

# p get_char_count('Mississippi') == { 4 => %w[i s], 2 => ['p'], 1 => ['m'] }
# p get_char_count('Hello. Hello? HELLO!!') #== {6=>["l"], 3=>["e", "h", "o"]}
# p get_char_count('aaa...bb...c!') == { 3 => ['a'], 2 => ['b'], 1 => ['c'] }
# p get_char_count('aaabbbccc') == { 3 => %w[a b c] }
# p get_char_count('abc123') == { 1 => %w[1 2 3 a b c] }

# Write a method that takes a string as an argument and groups the number of times each character appears in the string as a hash sorted by the highest number of occurrences.
#
# The characters should be sorted alphabetically e.g:
#
# get_char_count("cba") => {1=>["a", "b", "c"], 2 => ['d']}
# You should ignore spaces, special characters and count uppercase letters as lowercase ones.

# prob: given a string, return a hash with integer keys representing the number of times a given char appears in the str, with an array of the chars that appear that number of times in the str.
# in: str, out: hash with array values
# rules: ignore spaces, treat all letters as lowercase, ignore special characters
# alg:
# 1. downcase and select only a-z and 0-9
# 2. split the str into an array, select only unique values
# 3. group this array by the count of the letter in the clean str

def get_char_count(str)
  clean_str = str.downcase.gsub(/[^a-z0-9]/, '')
  unique = clean_str.chars.uniq.sort!
  unique.group_by { |el| clean_str.chars.count(el) }
end
p get_char_count('Mississippi') == { 4 => %w[i s], 2 => ['p'], 1 => ['m'] }
p get_char_count('Hello. Hello? HELLO!!') == { 6 => ['l'], 3 => %w[e h o] }
p get_char_count('aaa...bb...c!') == { 3 => ['a'], 2 => ['b'], 1 => ['c'] }
p get_char_count('aaabbbccc') == { 3 => %w[a b c] }
p get_char_count('abc123') == { 1 => %w[1 2 3 a b c] }
p 0.to_f
p 0.to_f.to_s.to_i
p 'a'.to_i.to_s == 'a'
p '5'.to_i.to_s == '5'
p '0'.to_i.to_s == '0'

arr = [1, 2, 3, 4]
final = []
0.upto(arr.length - 2) do |index|
  2.upto(arr.length - index) do |num|
    final << arr[index, num].join.to_i
  end
end
p final

str = 'hellobyhdfjfdkghd'
final = []
0.upto(str.length - 2) do |index|
  1.upto(str.length - index) do |sub_length|
    final << str[index, sub_length]
  end
end
p final

multi_word_str = 'hey man how are you doing today yo yo yo'
words = multi_word_str.split(' ')
sets = []
0.upto(words.length - 2) do |index|
  2.upto(words.length - index) do |sub_length|
    sets << words[index, sub_length].join(' ')
  end
end
p sets

final = []
0.upto(arr.length - 2) do |index|
  2.upto(arr.length - index) do |sub_length|
    final << arr[index, sub_length]
  end
end

p final

final = []
word = 'halo'
0.upto(word.length - 2) do |index|
  2.upto(word.length - index) do |length|
    final << word[index, length]
  end
end
p final

arr = [1, 2, 3, 4]
p arr.map.with_index { |_el, i| arr[-1 - i] }
reversed = []
arr.each_index do |index|
  reversed.unshift(arr[index])
end
arr = [1, 2, 3, 4]
i = 0
loop do
  arr[i], arr[-1 - i] = arr[-1 - i], arr[i]
  i += 1
  break if i == arr.length - 1
end
p arr
p reversed

