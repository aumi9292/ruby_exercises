# frozen_string_literal: true

require 'pry'
require 'pry-byebug'
# cute angles

DEGREE = "\xC2\xB0"

def dms(angle)
  angle = angle % 360
  degrees = angle.floor
  minutes = ((angle - degrees) * 60).round(2)
  seconds = ((minutes - minutes.floor) * 60).round(2)
  format(%(#{degrees}#{DEGREE}%.2d'%.2d"), minutes.to_i, seconds.to_i)
end

dms(254.6) #== %(254°36'00")
dms(93.034773) #== %(93°02'05")
p dms(76.73) #== %(76°43'48")

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# delete vowels
# def remove_vowels(array)
#   array.reject do |string|
#     string.chars.map do |letter|
#       /[aeiou]/ =~ letter.downcase
#     end
#   end
# end

def remove_vowels(array)
  array.map do |word|
    word.chars.reject { |letter| %w[a e i o u].include?(letter.downcase) }.join
  end
end

p remove_vowels(%w[abcdefghijklmnopqrstuvwxyz]) #== %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w[green YELLOW black white]) #== %w(grn YLLW blck wht)
p remove_vowels(%w[ABC AEIOU XYZ]) == ['BC', '', 'XYZ']

# fib num location by length
def fib(repeat)
  num1 = 1
  num2 = 1
  repeat.times do
    num1, num2 = num2, num1 + num2
  end
  num1
end

p fib(10)

def find_index(digits)
  i = 1
  loop do
    final = fib(i)
    i += 1
    return i if final.to_s.length == digits
  end
end

p find_index(100)

# reversed arrays pt 1

def rev(list)
  list.sort! { |a, b| b <=> a }
end

list = [1, 2, 3, 4]
p rev(list)
p rev(list).object_id == list.object_id

def rev2(list)
  ldex = 0
  rdex = -1
  loop do
    list[ldex], list[rdex] = list[rdex], list[ldex]
    ldex += 1
    rdex -= 1
    break if -rdex - 1 == ldex
  end
  list
end

p rev2(list)
p rev2(list).object_id == list.object_id

# reversed array pt 2
def reverse(array)
  final = []
  i = array.length - 1
  loop do
    break if i < 0

    final << array[i]
    i -= 1
  end
  final
end

p reverse([1, 2, 3, 4]) #== [4, 3, 2, 1] # => true
p reverse(%w[a b e d c]) == %w[c d e b a]  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []

def reverse2(array)
  array.reduce([]) { |new_array, i| new_array << -i }
end

p reverse2([1, 2, 3, 4, 5])

arr = [1, 2, 3, 4]
p arr.reduce(1) { |product, operand| product * operand }

def reverse(array)
  array.reduce([]) { |new_array, i| new_array << array[-i] }
end

p reverse([5, 3, 2, 1])
# combining arrays
def merge(arr1, arr2)
  arr1 += arr2
  arr1.uniq
end
p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

def merge(arr1, arr2)
  final = []
  arr1 += arr2
  arr1.each do |el|
    final << el unless final.include?(el)
  end
  final
end
p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# halvsies
def halvsies(arr)
  middle = (arr.length / 2.0).ceil
  [arr.slice(0, middle), arr.slice(middle, arr.length)]
end

p halvsies([1, 2, 3, 4])
p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) #== [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) #== [[], []]

# easy 6 find the duplicate
def find_dup(arr)
  arr.reduce(0) { |acc, current| arr.count(current) == 2 ? current : acc }
end

p find_dup([1, 5, 3, 1]) #== 1
p find_dup([18, 9, 36, 96, 31, 19, 54, 75, 42, 15,
            38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
            14, 61, 90, 81, 8, 63, 95, 99, 30, 65,
            78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
            89, 10, 84, 1, 47, 68, 12, 33, 86, 60,
            41, 44, 83, 35, 94, 73, 98, 3, 64, 82,
            55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
            85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
            40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
            7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

# does my list include this?
def include?(arr, search_term)
  arr.reduce(false) { |acc, current| current == search_term ? true : acc }
end

puts
p include?([1, 2, 3, 4, 5], 3) == true
p include?([1, 2, 3, 4, 5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

# right triangles

def triangle(side_length)
  n = 1
  loop do
    break if n > side_length

    puts ' ' * (side_length - n) + ('*' * n)
    n += 1
  end
end

triangle(100)
