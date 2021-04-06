# frozen_string_literal: true

require 'pry'
# frozen_string_literal: true

book1 = "Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth."

def longest_sentence(text)
  longest = text.split(/[!\?\.]/).max_by(&:length)
  puts longest
  puts longest.split(' ').length
end

longest_sentence(book1)

def abc(word)
  block_combos = [%w[b o], %w[x k], %w[d q], %w[c p], %w[n a], %w[g t], %w[r e], %w[f s], %w[j w], %w[h u], %w[v i], %w[l y], %w[z m]]
  word = word.downcase
  block_combos.each do |combo|
    return false if word.include?(combo[0]) && word.include?(combo[1])
  end
  true
end

p abc('BATCH') == true
p abc('BUTCH') == false
p abc('jest') == true

# lettercase percentage ratio
def letter_percentages(string)
  final = { lowercase: 0, uppercase: 0, neither: 0 }
  str_arr = string.chars
  str_arr.each do |letter|
    if letter != letter.upcase
      final[:lowercase] += 1
    elsif letter != letter.downcase
      final[:uppercase] += 1
    else
      final[:neither] += 1
    end
  end
  final.map { |k, v| [k, ((v.to_f / str_arr.length) * 100).round(2)] }.to_h
end

p letter_percentages('abCdef 123') #== { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') #== { lowercase: 0, uppercase: 0, neither: 100 }
p letter_percentages('abcdefGHI')

# matching parentheses
# def balanced?(string)
#   return false if string.index(')') < string.index('(')

#   string.count('(') == string.count(')')
# end

# def balanced?(str)
#   parentheses = str.chars.select { |char| ['(', ')'].include?(char) }
#   if parentheses.length.even?

#     firsts = parentheses.map.with_index do |el, i|
#       (el == parentheses[i + 1] && (parentheses[i + 2] != parentheses[i + 3]))
#     end
#     return firsts.all?(true)
#   end
#   false
# end

# problem: given a string, return a boolean whether the string contains matching parentheses. matching parentheses must occur in sets of ( and ). lpar and rpar count must be equal--the distributions of lpars and rpars must be equal
# in: string out: boolean
# alg
# 1. init counter variable to 0
# 2. iterate over chars in string, increment counter += 1 for '(' and -1 for ')'
# 3. if at any point counter is less than 0, return false
# 4. after iteration, return true if counter == 0, return false otherwise

def balanced?(str)
  count = 0
  str.chars.each do |char|
    count += 1 if char == '('
    count -= 1 if char == ')'
    return false if count < 0
  end
  count.zero? ? true : false
end

puts
p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

# triangle sides
# problem: given three integers that represent the lengths of three sides of a potential triangle, determine if 1. the three numbers represent a valid triangle, 2. if the triangle is equilateral, scalene, or isosceles
# rules: valid triangles--two sides added are greater than the largest side, all sides are greater than 0
# equi: all integers are equal
# isosceles: 2 equal, 1 not
# scalene: all different
# in: 3 ints
# out: one of 4 symbols
# alg
# 1. check if any side is 0, return :invalid if it is
# 2. determine the longest side by comparing all three ints
# 3. check if the other two sides are greater than the longest side, return :invalid if not
# 4. check if all ints are equal, return :equilateral
# 5. check is 2 are equal, 1 is differnt, return :isosceles
# 6. check if all 3 are different, return :scalene

def valid_triangle?(s1, s2, s3)
  sides = [s1, s2, s3]
  longest = sides.max
  other_sides = sides.sort[0..1]
  sides.all? { |side| side > 0 } && other_sides.sum > longest
end

def triangle(s1, s2, s3)
  return :invalid unless valid_triangle?(s1, s2, s3)

  sides = [s1, s2, s3]
  return :equilateral if [s1] * 3 == sides
  return :scalene if s1 != s2 && s2 != s3 && s1 != s3
  return :isosceles if s1 == s2 || s2 == s3 || s1 == s3
end

p triangle(6, 6, 10)
p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

# problem: given three integers that rep the angles of a triangle, return one of 4 symbols-- :right (1 angle == 90), :acute (all less than 90) :obtuse (one greater than 90), or :invalid (all 3 ints must be greater than 0 and == 180)

# in: 3 ints, out: 1 of 4 symbols (:right, :acute, :obtuse, :invalid)

# algorithm:
# 1. check that all numbers are > 0 and added together all == 180
# 1b. return :invalid unless these are true
# 2. check all angles < 90, return :acute
# 3. check 1 angle > 90, return :obtuse
# 4. check 1 angle == 90, return right

def triangle(s1, s2, s3)
  angles = [s1, s2, s3]
  return :invalid unless angles.all? { |angle| angle > 0 } && angles.sum == 180
  return :acute if angles.all? { |angle| angle < 90 }
  return :obtuse if angles.one? { |angle| angle > 90 }
  return :right if angles.one? { |angle| angle == 90 }
end

puts
p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid

# unlucky days
# problem: given a year after 1752 (start of gregorian calendar), return the number of fridays that are the thirteenth of the month for that year
# in: int, out: int
# rules: use gregorian calendar
# algorithm:
# 1. init a time object equal to Jan 1 of the year given as an argument
# 1c. init unlucky days counter assign to 0
# 2. init a loop
# check the time object to see if it's the 13th
# if it is, check to see if it's a friday
# if it is, add 1 to the unlucky_days count
# increment the time object by 1 day
# exit the loop when the time object is the year after the given year
# 3. return the unlucky_days count

def friday_13th(year)
  day = Time.new(year)
  unlucky_days = 0
  loop do
    unlucky_days += 1 if day.day == 13 && day.friday?
    day += 60 * 60 * 24
    break unless day.year == year
  end
  unlucky_days
end

p friday_13th(2015)

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
p friday_13th(2042)

# featured number
# problem: given an integer, return the next integer that is a 'featured number.' Featured numbers have each of their digits only once, are odd, and are multiples of 7
# rules:
# the given integer may or may not be a featured number
# must return the first featured number that is larger than the given number
# must return: There is no possible number that fulfills those requirements if no number exists that will be a featured number
# algorithm
# a. create a series of integers, from 7 up to
# 1. starting at 7, step up to 7 + the input number by 7.
# 2. check if the final number is odd and check if all the digits are unique

# alg 2
# 1. starting at the given integer
# init loop
# check if number is a multiple of 7 and if all the digits are unique
# exit loop and return this number if so
# increment number by 1
# exit loop and return error message if number is larger than 10 trillion (9999999999)

def featured(int)
  loop do
    int += 1
    return int if is_featured?(int)
    return 'There is no possible number that fulfills those requirements' if int >= 9_999_999_999
  end
end

def is_featured?(int)
  (int % 7).zero? && int.odd? && int.digits.uniq.length == int.digits.length
end

# p featured(12) == 21
# p featured(20) == 21
# p featured(21) == 35
# p featured(997) == 1029
# p featured(1029) == 1043
# p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1_023_456_987

# bubble sort
# problem: given an array, replicate the bubble sort algorithm to return the original object passed in, sorted from least to greatest
# rules: bubble sort--iterate over each element in the array, switching positions if the el on the left is larger than the el on the right. continue going through this process until no switches are made
# alg
# init sorted flag, set to false
# init loop
# init left_el at 0
# init right_el at 1
# check pair of items--compare the first and second. if the first is greater than the second, switch them
# set sorted flag to false after any iteration where left and right elements are switched
# add 1 to left_el and right_el
# until the checks all result in no position switches, continue another round of iteration

def bubble_sort!(arr)
  loop do
    left_idx = 0
    right_idx = 1
    switch_count = 0

    loop do
      if arr[left_idx] > arr[right_idx]
        arr[left_idx], arr[right_idx] = arr[right_idx], arr[left_idx]
        switch_count += 1
      end

      left_idx += 1
      right_idx += 1
      break if right_idx == arr.length
    end

    break if switch_count == 0
  end
  arr
end

# p bubble_sort!([5, 3])
# array = [6, 2, 7, 1, 4]
# array = %w[Sue Pete Alice Tyler Rachel Kim Bonnie]

# p bubble_sort!(array)
# p array

# sum quare - square sum
# problem: given an integer, return an integer that is the return value of sutracting the square value of all integers from 1 up to the given integer summed, by the value of summing the square of each integer from 1 up to the given integer
# in--int, out: int
# two major parts:
# 1. calculate the square of summing all ints 1 to the given int
# 2. calculate the sum of each squared int from 1 to the given int

# alg
# a. init sum
# b. init squared_sums
# 1. from 1 up to the given int, add each number to the sum variable
# 2. square the sum
# 3. from 1 to the given int, square each number and add it to the sqaured_sums
# 4. subtract sum - squared_sums

def sum_square_difference(int)
  sum = 0
  squared_sums = 0
  1.upto(int) { |num| sum += num }
  1.upto(int) { |num| squared_sums += num**2 }

  sum **= 2
  sum - squared_sums
end

def fancy(int)
  (1..int).sum**2 - (1..int).reduce { |acc, value| acc + value**2 }
end

p sum_square_difference(3)
p fancy(3)
p sum_square_difference(3) == 22
# -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25_164_150


class Greet
  def initialize 
    @phrase = "hello"
  end 
end 

hi = Greet.new 
p hi 
puts hi 
