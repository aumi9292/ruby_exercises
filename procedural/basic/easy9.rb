# frozen_string_literal: true

# welcome stranger
def greetings(arr, hsh)
  name = arr.join(' ')
  full_title = hsh[:title] + ' ' + hsh[:occupation]
  puts "Hello #{name}. Nice to has a #{full_title} around."
end

greetings(%w[John Q Doe], { title: 'Master', occupation: 'Plumber' })

# daily doubles
def twice(int)
  str_int = int.to_s
  middle = (str_int.length / 2).ceil
  str_int[0...middle] == str_int[middle..-1] ? int : int * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334_433) == 668_866
p twice(444) == 888
p twice(107) == 214
p twice(103_103) == 103_103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

# always return negative
def negative(int)
  int == int.abs ? -int : int
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0

# counting up
def sequence(int)
  int.positive? ? Array(1..int) : Array(int..-1).sort { |a, b| b <=> a }
end

# def sequence(int)
#   1.upto(int).map { |num| num }
# end

# def sequence(int)
#   i = 1
#   final = []
#   loop do
#     final << i
#     i += 1
#     break if i > int
#   end
#   final
# end

p sequence(5) #== [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-10)

# uppercase check
def uppercase?(str)
  str.split.reduce(true) { |bool, chr| chr.upcase == chr ? bool : false }
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

# how long are you
def word_lengths(str)
  str.split.map { |word| "#{word} #{word.length}" }
end

p word_lengths('cow sheep chicken') #== ['cow 3', 'sheep 5', 'chicken 7']

p word_lengths('baseball hot dogs and apple pie') ==
  ['baseball 8', 'hot 3', 'dogs 4', 'and 3', 'apple 5', 'pie 3']

p word_lengths("It ain't easy, is it?") == ['It 2', "ain't 5", 'easy, 5', 'is 2', 'it? 3']

p word_lengths('Supercalifragilisticexpialidocious') ==
  ['Supercalifragilisticexpialidocious 34']

p word_lengths('') == []

# name swapping
def swap_name(str)
  str.split.reverse.join(', ')
end

p swap_name('Austin Miller')

# sequence count
def sequence(n1, n2)
  Array.new(n1) { |i| n2 * (i + 1) }
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1_000_000) == []

# grade book
def get_grades(*scores)
  avg = scores.reduce(&:+) / scores.length
  case avg
  when 0...60 then 'Fail'
  when 60...70 then 'D'
  when 70...80 then 'C'
  when 80...90 then 'B'
  else
    'A'
  end
end

p get_grades(95, 90, 93) == 'A'
p get_grades(50, 50, 95) == 'D'

# grocery list
def grocery_list(list)
  final = []
  list.each do |item|
    item[1].times { final << item[0] }
  end
  final
end

p grocery_list([['apples', 3], ['orange', 1], ['bananas', 2]]) #==
%w[apples apples apples orange bananas bananas]
