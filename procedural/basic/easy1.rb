# repeat yourself
def repeat(string, repeat)
  repeat.times { puts string }
end

repeat('Hello', 3)

# odd
def is_odd?(integer)
  integer.remainder(2) != 0
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

# list of digits
def digit_list(integer)
  integer.to_s.split('').map(&:to_i)
end

puts digit_list(12_345) == [1, 2, 3, 4, 5] # => true
puts digit_list(7) == [7] # => true
puts digit_list(375_290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4] # => true

# how many?
def count_occurrences(array)
  final = Hash.new(0)
  array.each { |el| final[el] += 1 if el.downcase == el }
  puts final
end

vehicles = %w(
  car car truck car SUV truck
  motorcycle motorcycle car truck suv
)

count_occurrences(vehicles)

# reverse it (part 1)
def reverse_sentence(string)
  string.split.reverse.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

# reverse it part 2
def reverse_words(string)
  string.split.map { |el| el.length >= 5 ? el.reverse : el }.join(' ')
end

p reverse_words('Hi there bobbbbbbb')

# stringy strings
def stringy(int, start = 1)
  if start == 1
    int.even? ? '10' * (int / 2) : ('10' * ((int + 1) / 2)).slice(0..-2)
  else
    int.even? ? '01' * (int / 2) : ('01' * ((int + 1) / 2)).slice(0..-2)
  end
end

p stringy(6, 0)

# array average
def average(array)
  array.reduce(0.0, &:+) / array.length
end

p average([1, 2, 3, 4, 5])
puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])

# sum of digits
def sum(integer)
  integer.to_s.chars.map(&:to_i).sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

# what's my bonus
def calculate_bonus(salary, getting_it)
  getting_it ? salary / 2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50_000, true) == 25_000
