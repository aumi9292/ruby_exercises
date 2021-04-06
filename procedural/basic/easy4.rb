# short long short
def short_long_short(str1, str2)
  final = ''
  longest, shortest = str1.length > str2.length ? [str1, str2] : [str2, str1]
  final << shortest << longest << shortest
end

p short_long_short('abc', 'defgh') #== 'abcdefghabc'
p short_long_short('abcde', 'fgh') == 'fghabcdefgh'
p short_long_short('', 'xyz') == 'xyz'

# what century is that?
def century(year)
  century = ((year + 99) / 100).to_s
  if century[-2, 2] == '11' || century[-2, 2] == '12' || century[-2, 2] == '13'
    century += 'th'
  elsif %w(0 4 5 6 7 8 9).include?(century[-1])
    century += 'th'
  elsif century[-1] == '1'
    century += 'st'
  elsif century[-1] == '2'
    century += 'nd'
  elsif century[-1] == '3'
    century += 'rd'
  end
  century
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10_103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11_201) == '113th'

# leap years p1 and 2
def leap_year?(year)
  if year >= 1752
    (year % 4 == 0 && year % 100 != 0) || (year % 100 == 0 && year % 400 == 0)
  else
    year % 4 == 0
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240_000) == true
p leap_year?(240_001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true

p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true

# multiples of 3 and 5
def multisum(integer)
  final = 0
  (1..integer).to_a.each { |i| final += i if (i % 3).zero? || (i % 5).zero? }
  final
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) #== 234168
p multisum(1000) #== 234168

# running totals
def running_total(array)
  final = []
  p array.each_with_index { |_el, i| final << array[0..i].reduce(0, :+) }
  p final
end

def running_total(array)
  sum = 0
  array.map { |value| sum += value }
end

def running_total(array)
  sum = 0
  array.each_with_object([]) do |num, new_array|
    new_array << sum += num
  end
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

# convert a string to a number
def string_to_integer(string)
  final = 0
  numerical_reference = %w(0 1 2 3 4 5 6 7 8 9)
  string.chars.reverse.each_with_index do |digit, index|
    numerical_reference.each_with_index do |num, i|
      final += (i * 10**index) if digit == num
    end
  end
  final
end

p string_to_integer('452')
p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

# hexadecimal to integer
def hex_to_int(string)
  final = 0
  hex = {
    '0' => 0,
    '1' => 1,
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9,
    'A' => 10,
    'B' => 11,
    'C' => 12,
    'D' => 13,
    'E' => 14,
    'F' => 15
  }

  string.upcase.chars.reverse.each_with_index do |digit, index|
    hex.each { |key, value| final += value * (16**index) if key == digit }
    p final
  end
  final
end

p hex_to_int('4D9f') #== 19_871

# convert string to a signed number
def string_to_signed_integer(string)
  number = string_to_integer(string)
  string[0] == '-' ? -number : number
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

def integer_to_string(integer)
  final = ''
  numerical_reference = %w(0 1 2 3 4 5 6 7 8 9)
  loop do
    integer, remainder = integer.divmod(10)
    final.prepend(numerical_reference[remainder])
    break if integer.zero?
  end
  final
end

p integer_to_string(156)

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

def signed_integer_to_string(integer)
  integer_string = integer_to_string(integer.abs)
  integer_string = if integer > 0
                     integer_string.prepend('+')
                   elsif integer < 0
                     integer_string.prepend('-')
                   else
                     integer_string
                   end
  integer_string
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
