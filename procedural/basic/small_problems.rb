require 'pry'
#Easy 1
def repeat(word, repeat)
  repeat.times {puts word}
end 

repeat("hello", 2)

def is_odd?(integer)
  integer % 2 != 0 
end 

p is_odd?(0)

def digit_list(number)
  nums = number.to_s.split("").map {|el| el.to_i }
end

p digit_list(12345)
p digit_list(37810)


vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def how_many(array)
  return_hash = {}
  array.each {|el| return_hash.key?(el) ? return_hash[el] += 1 : return_hash[el] = 1}
  return_hash
end 

p how_many(vehicles)

def reverse_sentence(string)
  string.split(" ").reverse
end 

p reverse_sentence("The billowing breeze bumbled over the land")

def reverse_sentence2(string)
  string.split(" ").map {|el| el.length > 5 ? el.reverse : el }
end 

p reverse_sentence2("The billowing breeze bumbled over the land")

def stringy(integer)
  i = 1 
  string = ""
  until i > integer 
    i.odd? ? string += "1" : string += "0" 
    i += 1 
  end 
  string 
end 

p stringy(9)
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

def average(array)
  sum = array.reduce(0) {|previous, current| previous + current }
  sum/array.length 
end 

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

def sum(integer)
  integer.to_s.split("").reduce(0) {|previous, current| previous.to_i + current.to_i}
end 

p sum(315)
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

def calculate_bonus(salary, status)
  status ? salary/2 : 0 
end 

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000


#Easy 2

def teddy_age
  "Teddy is #{rand(20..200)} years old!"
end 

p teddy_age
p teddy_age

def room_size
  puts "Enter the length of the room in meters:"
  length = gets.chomp.to_i
  puts "Enter the width of the room in meters:"
  width = gets.chomp.to_i
  puts "The area of the room is #{length*width} square meters (#{length*width*10.7639} square feet)." 
end 

# room_size

def tip_calculator
  puts "What is the bill?"
  bill = gets.chomp.to_f
  puts "What is the tip percentage?"
  tip = gets.chomp.to_f * 0.01
  puts "The tip is $#{bill * tip}"
  puts "The total $#{bill + (bill*tip)}"
end 

# tip_calculator

def age_retired
  year = Time.now.year.to_i
  puts "What is your age?"
  age = gets.chomp.to_i
  puts "At what age would you like to retire?"
  target_age = gets.chomp.to_i
  retirement_year = year + (target_age - age) 
  puts "It is #{year}. You will retire in #{retirement_year}"
  puts "You only have #{target_age - age} more years of work to go!"
end 

# age_retired

def greet_in_turn
  puts "What is your name?"
  name = gets.chomp
  puts name.include?("!") ? "HELLO #{name.upcase} WHY ARE YOU SHOUTING AT ME?" : "Hi there #{name}"
end 

# greet_in_turn

1.step(99, 2) {|num| puts num}
2.step(98, 2) {|num| puts num}

#product or sum 
def recursive_sum(num)
  unless num == 1
    num + recursive_sum(num - 1)
  else 
    return 1
  end 
end 

p recursive_sum(5)

def recursive_product(num)
  unless num == 1
    num * recursive_product(num - 1)
  else 
    return 1
  end 
end 

p recursive_product(5)


def product_sum
  loop do 
    puts "Enter an integer greater than 1"
    number = gets.chomp.to_i
    if number <= 1 
      puts "Sorry, not valid"
      next 
    end 
    puts "Enter 's' to compute the sum or 'p' to compute the product"
    operation = gets.chomp.downcase
    if operation == 's'
      puts "The sum of the integers betwen 1 and #{number} is #{recursive_sum(number)}"
      break 
    elsif operation == 'p'
      puts "The product of the integers between 1 and #{number} is #{recursive_product(number)}"
      break 
    else
      puts "Sorry, that is not a valid operation, please press any character other than 'q' to try again or press 'q' to quit."
      response = gets.chomp
    end 
    response == 'q' ? break : next
  end 
end 

# product_sum

# upcase! mutates the value in place, so all references to it are upcased. 
name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# upcase! mutates the caller in place, so any other reference to that value has also been upcased. 
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

#Easy 3
#Searching 101

def search_6
  num_array = []
  puts "Enter the 1st number"
  num_array << num1 = gets.chomp.to_i 
  puts "Enter the 2nd number"
  num_array << num2 = gets.chomp.to_i 
  puts "Enter the 3rd number"
  num_array << num3 = gets.chomp.to_i 
  puts "Enter the 4th number"
  num_array << num4 = gets.chomp.to_i 
  puts "Enter the 5th number"
  num_array << num5 = gets.chomp.to_i 
  puts "Enter the last number"
  num6 = gets.chomp.to_i 
  puts num_array.include?(num6) ? "The number #{num6} appears in #{num_array}" : "The number #{num6} does not appear in #{num_array}"
end 

# search_6

def looped_search_6
  num_array = []
  5.times do |count|
    puts "Enter the #{count+1} number"
    num_array << num = gets.chomp.to_i
  end 
  puts "Enter the last number"
  num6 = gets.chomp.to_i 
  puts num_array.include?(num6) ? "The number #{num6} appears in #{num_array}" : "The number #{num6} does not appear in #{num_array}"
end 

# looped_search_6

def arithmetic_integer
  puts "Enter a positive number"
  num1 = gets.chomp.to_i
  puts "Enter a second positive number"
  num2 = gets.chomp.to_i
  puts "#{num1} + #{num2} = #{num1 + num2}"
  puts "#{num1} - #{num2} = #{num1 - num2}"
  puts "#{num1} * #{num2} = #{num1 * num2}"
  puts "#{num1} / #{num2} = #{num1.to_f / num2}"
  puts "#{num1} % #{num2} = #{num1 % num2}"
  puts "#{num1} ** #{num2} = #{num1 ** num2}"
end 

# arithmetic_integer

def character_counter
  puts "Please enter a word or multiple words: "
  string_to_count = gets.chomp
  count = 0 
  string_to_count.split("").each {|character| count += 1 unless character == " "}
  puts "There are #{count} characters in #{string_to_count}."
end 

# character_counter


def multiply(*nums)
  nums.reduce(1) {|prev, current| prev * current }
end 

p multiply(3, 5, 10)

def square(num)
  num ** 2
end 

p square(-8) == 64

def xor?(bool1, bool2)
  (bool1 && !bool2) || (!bool1 && bool2)
end 

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

p 5.even? ^ 4.even? 

def oddities(array)
  odd_indexes_array = []
  array.each_with_index {|item, index| odd_indexes_array << item if (index+1).odd?}
  odd_indexes_array
end 

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

def palindrome?(string)
  string == string.reverse
end 

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

def real_palindrome?(string)
  alphanumeric = string.split("").map {|item| item if item.is_a?(Integer) || ('a'..'z').include?(item.downcase)}.join
  alphanumeric.downcase == alphanumeric.reverse.downcase
end 

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false

def palindromic_number?(num)
  reverse_num = num.to_s.split("").reverse.join.to_i
  num == reverse_num
end 

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true

#Easy 4

#Short long short
def short_long_short(str1, str2)
  shortest, longest = str1.length > str2.length ? [str2, str1] : [str1, str2]
  shortest + longest + shortest
end 

p short_long_short("hlelelelelele", "al")
p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"

# What century is that? 
def century(year)
  century = ((year+99)/100).to_s
  final_number = century[-1].to_i
  last_two_numbers = century[-2, 2].to_i
  if last_two_numbers.between?(10, 20)
    century += 'th' 
  elsif final_number == 0 || final_number.between?(4, 9)
    century += 'th'
  elsif final_number == 1
    century += 'st'
  elsif final_number == 2
    century += 'nd'
  elsif final_number == 3
    century += 'rd'
  end 
end 

p century(1956)
p century(2145)
p century(1145)

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

#leap year boolean
def div_by_4(number)
  number%4 == 0 
end 

def div_by_100(number)
  number%100 == 0 
end 

def div_by_400(number)
  number%400 == 0 
end 

def leap_year?(year)
  (div_by_4(year) && (year < 1754 || !div_by_100(year))) || (div_by_100(year) && div_by_400(year)) 
end 

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true

#multiples of 3 and 5 from 1 to arg

def multisum(ending_number)
  sum = 0 
  ending_number.times do |count|
    sum += (count+1) if (count+1)%3 == 0 || (count+1)%5==0
  end 
  sum 
end 

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

#running totals array

def running_total(array)
  final = []
  running = 0 
  array.each_with_index do |el, i|
    running += el 
    final[i] = running
  end 
  final
end 

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) #== [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

#string to integer
def string_to_integer(string)
  number_characters = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
  nums_array = []
  nums_in_places = []
  string.split("").each do |num|
    i = 0 
    while i < number_characters.length do 
      nums_array << i if number_characters[i] == num
      i += 1
      binding.pry
    end 
  end 
  ones_digit = nums_array.pop
  nums_array.reverse.each_with_index {|num, i| nums_in_places << num * (10**(i+1))}
  final = nums_in_places.reduce(ones_digit) {|prev, current| prev + current }
  final 
end 

p string_to_integer('4321')
p string_to_integer('570')

#convert string to signed number
def string_to_signed_integer(string)
  sign = string.chars.shift if string[0] == '+' || string[0] == '-'
  final = string_to_integer(string)
  sign == '-' ? final * -1 : final
end 

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

#integer to string
def integer_to_string(integer)
  "#{integer}"
end 

p integer_to_string(4321)
p integer_to_string(0)
p integer_to_string(5000) == '5000'

# def i_to_s(integer)
#   num_hash = {0: "0", 1: "1", 2: "2", 3: "3", 4: "4", 5: "5", 6: "6", 7: "7", 8: "8", 9: "9"}
# end 

#Easy 5
#ASCII string value

def ascii_value(string)
  sum = 0 
  string.chars.each {|letter| sum+= letter.ord}
  sum 
end 

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

#time of day
def time_of_day(integer)
  hours = 0
  minutes_singles = 0
  minutes_tens = 0 
  if integer < 10 
    "00:#{minutes_tens}#{integer}"
  elsif integer < 60 
    "00:#{integer}"
  else 
    "#{integer/60}"
  end 

end 

p time_of_day(0)
p time_of_day(400)
p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"


#skipped several 
#Letter Swap
def swap(string)
  string.split(" ").each {|word| word[0], word[-1] = word[-1], word[0]}.join(" ")
end 

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Oh what a wonderful day it is')
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

#clean up the words
def cleanup(string)
  final = ""
  string.chars.each_with_index {|char| ("a".."z").include?(char.downcase) ? final += char : final += " "}
  final.squeeze(" ")
end 

p cleanup("---what's my +*& line?") == ' what s my line '

#letter counter p1
def word_sizes(string)
  count_hash = {}
  string.split(" ").each do |word|
    count_hash[word.length] ? count_hash[word.length] += 1 : count_hash[word.length] = 1 
  end 
  count_hash
end 

p word_sizes('Four score and seven.')
p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

def word_sizes2(string)
  count_hash = {}
  abc_string = ""
  string.split(" ").each do |word|
    word.chars.each do |char| 
      abc_string << char if ("a".."z").include?(char.downcase) || char == " "
    end 
    abc_string << " "
  end 
  p abc_string
  abc_string.split(" ").each do |word|
    count_hash[word.length] ? count_hash[word.length] += 1 : count_hash[word.length] = 1 
  end 
  count_hash
end 

p word_sizes2('Four score and seven.')
p word_sizes2('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes2('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes2("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes2('') == {}

#alphabetic number sort
def alphabetic_number_sort(array)
  alpha_num_hash = {zero: 0, one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9, ten: 10, eleven: 11, twelve: 12, thirteen: 13, fourteen: 14, fifteen: 15, sixteen: 16, seventeen: 17, eighteen: 18, nineteen: 19}
  final = alpha_num_hash.sort.map {|k, v| v}
end 

alphabetic_number_sort([1, 4, 3, 1])
p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

#daily double
def crunch(string)
  final = ""
  letter_array = string.chars
  letter_array.each_with_index {|char, i| final += char unless letter_array[i+1] == char}
  p final 
end 

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

def print_in_box(string)
  mutli_line = <<MLS
+--+
|  |
|"#{string}"|
|  |
+--+
MLS

end 

p print_in_box('')
p print_in_box('To boldly go where no one has gone before.')


#spin me around in circles
sentence = "hello world"
def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

p spin_me(sentence)
p sentence

#easy 6

#cute angles
DEGREE = "\xC2\xB0"
def dms(degree)
  secs_symbol = '"'
  degrees = degree.floor
  mins_dec = (degree - degrees) 
  mins = mins_dec * 60 
  secs_dec = mins - mins.floor
  secs = secs_dec * 60 
  p %(#{degrees}#{DEGREE} #{"%02d" % mins.round}'#{"%02d" % secs.round}")

end 
p dms(30) == %(30°00'00")
p dms(30)
p dms(76.73) == %(76°43'48")
p dms(76.73)
p dms(254.6) == %(254°36'00")
p dms(254.6)
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

#remove vowels
def remove_vowels(array)
  final = array.map do |el| el.gsub(/[aeiouAEIOU]/, "")
  end 
  p final  
end 

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

def find_fibonacci_index_by_length(length)
  fib_array = [1, 1]
  i = 0 
    while i < length*50
    fib_array << (fib_array[-1] + fib_array[-2])
    i += 1 
    end 
    fib_array
    1 + fib_array.find_index {|el| el.to_s.length == length }
end 

p find_fibonacci_index_by_length(5)
p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(3)        # 1 1 2 3 5 8 13 21 34 55 89 144
# p find_fibonacci_index_by_length(10) == 45
# p find_fibonacci_index_by_length(100) == 476
# p find_fibonacci_index_by_length(1000) == 4782
# p find_fibonacci_index_by_length(10000) == 47847

#reversed array in place
def cust_reverse_in_place(array)
  i = array.length-1
  dup = []
  until i < 0
    dup << array[i]
    i -= 1
  end 
  array.clear
  dup.each {|el| array << el } 
  array
end 
a = [1, 2, 3]
b = cust_reverse_in_place(a)
p a.object_id == b.object_id

#reverse and return new array

def cust_reverse(array)
  final = []
  i = array.length - 1
  until i < 0 
    final << array[i]
    i -= 1
  end
  final  
end 

p cust_reverse([1, 2, 3])
a = [1, 4, 4, 4, 5, 6, 6, 7, 8]
#combining arrays
def merge (arr1, arr2)
  final = []
  arr1.each {|el| final << el unless final.include?(el)}
  arr2.each {|el| final << el unless final.include?(el)}
  final 
end 

p merge(a, [1, 2])

def halvsies(arr1)
  final = []
  inner_first = []
  inner_second = []
  arr1.each_with_index {|el, i| i < arr1.length/2 ? inner_first << el : inner_second << el }
  final << inner_first << inner_second
end 

p halvsies(a)

def find_dup(array)
  final = array.reject {|el| array.count(el) < 2}
  final 
end 

p find_dup([1, 2, 3, 4, 5, 7, 8, 1, 10, 13, 14, 16])

def find_dup2(array)
  array.sort.each_with_index {|el, i| return el if el == array.sort[i+1]}
end 

p find_dup2([1, 2, 3, 4, 5, 7, 8, 1, 10, 13, 14, 16])

def cust_include(array, arg)
  array.each {|el| return true if el == arg}
  false 
end 

p cust_include([1, 2, 3], 10)


#easy 7

def interleave(a1, a2)
  final = []
  a1.each_with_index {|el, i| final << el << a2[i] } 
  final 
end 

a = [1, 2, 3]
b = ['a', 'b', 'c']

p interleave(a, b)

def letter_case_count(string)
  return_hash = {lowercase: 0, uppercase: 0, neither: 0}
  string.chars.each {|el| (el == el.upcase && ("a".."z").include?(el.downcase)) ? return_hash[:uppercase] += 1 : (el == el.downcase && ("a".."z").include?(el.downcase)) ? return_hash[:lowercase] += 1 : return_hash[:neither] += 1}
  return_hash
end 

p letter_case_count('abCdef 123')
p letter_case_count('AbCd +Ef')
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
p letter_case_count('')

def word_cap(string)
  final = string.split(" ").map {|el| el.capitalize}.join(" ")
end 

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

def swapcase(string)
  final = ""
  string.each_char do |char| 
    final << char unless ("a".."z").include?(char.downcase)
    final << char.upcase unless char.upcase == char
    final << char.downcase unless char.downcase == char
  end  
  final 
end 

p swapcase('CamelCase')
p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV')
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'


def staggered_case1(string)
  return_string = ""
  i = 0 
  while i < string.length do 
    
    i.even? ? return_string << string[i].upcase : return_string << string[i].downcase 
    i += 1
  end 
  p return_string 
end 

# p staggered_case("Hello my hnamsf sdf")
# p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# p staggered_case('I Love Launch School!')
# p staggered_case('ALL_CAPS') == 'AlL_CaPs'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'



#staggered case first attempt at 1, passes all but one test for 2
# def staggered_case(string)
#   count = 0 
#   final = string.split(" ").map do |word|
#     word.chars.map do |letter|
#       count += 1
#       count.odd? ? letter.upcase : letter.downcase
#     end  
#   end 
#   word_array = final.map {|el| el.join}
#   return_string = word_array.join(" ")

# end 

def staggered_case(string)
  i = 0 
  final = ""
  even_status = true 
  while i < string.length do 
    unless ("a".."z") === string[i].downcase
      final << string[i] 
      i += 1
      next 
    end 
    even_status ? final << string[i].upcase : final << string[i].downcase
    even_status = !even_status
    i += 1
  end
  final 
end 

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
p staggered_case('ignore 77 the 444 numbers')

def show_multiplicative_average(array)
  multiplied = array.reduce(1) { |previous, current| previous * current }
  multiplied/array.length.to_f
end 

p show_multiplicative_average([2, 5, 7, 11, 13, 17])

def multiply_list(arr1, arr2)
  final = arr1.each_with_index.map {|el, i| el * arr2[i]}
end 

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]


def multiply_all_pairs(arr1, arr2)
  final = []
  arr1.each do |el|
    arr2.each do |el2| 
      final << el * el2
    end 
  end 
  final.sort
end 

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

def penultimate(string)
  string.split(" ")[-2]
end 

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

def sum_of_sums(array)
  sum = 0 
  while array.length > 0
  array.each {|el| sum += el }
  array.pop
  end 
  sum 
end 

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

def mad_lib
  puts "Enter a noun"
  noun = gets.chomp
  puts "Enter a verb"
  verb = gets.chomp
  puts "Enter a adjective"
  adjective = gets.chomp
  puts "Enter a adverb"
  adverb = gets.chomp
  puts "The #{noun} couldn't wait to voraciously #{verb} at the park. It was such a #{adjective} day and I knew everything was going to go #{adverb}."
end 

# mad_lib

def substrings_at_start(string)
  final = []
  i = 0 
  while i < string.length 
    final << string.slice(0..i)
    i += 1
  end
  final 
end 

p substrings_at_start('abc') #== ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

def substrings(string)
  final = []
  until string.length == 0 
  final << substrings_at_start(string)
  string.slice!(0) 
  end 
  final.flatten
end 

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

def palindromes(string)
  letter_array = substrings(string)
  final = letter_array.select {|el| el.length > 1 && el == el.reverse }
end 

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

def fizzbuzz(start_num, end_num)
nums = end_num - start_num
  (start_num..end_num).size.times do |num| 
    start = num + start_num
    puts start % 15 == 0 ? "Fizzbuzz!" : start % 3 == 0 ? "Fizz!" : start %5 == 0 ? "Buzz!" : start
  end 
end 

fizzbuzz(1, 15)

def repeater(string)
  string.chars.map {|el| el*2}.join("")
end 

p repeater('Hello')
p repeater("Good job!") #== "GGoooodd  jjoobb!!"
p repeater('') == ''

def double_consonants(string)
  doubled_array = string.chars.map do |el| 
    ("a".."z").include?(el.downcase) && !"aeiou".include?(el.downcase) ? el*2 : el 
  end
  doubled_array.join
end 

p double_consonants('String') #== "SSttrrinngg"
p double_consonants("Hello-World!") #== "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

def reversed_number(num)
  num.to_s.chars.reverse.join.to_i 
end 

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1

def center_of(string)
  until string.length <= 2
    string.slice!(0)
    string.slice!(-1)
  end 
  string 
end 

puts ""
p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'

def center2 (string)
  final = ""
  halved = string.chars
  halved.each_with_index do |el, i| 
    if string.length.odd? 
      final = halved[string.length / 2]
    elsif string.length.even? 
      final = halved[((string.length / 2) - 1), 2]
    end
  end 
  final.is_a?(Array) ? final.join : final 
end 

p center2 ("hello there young foellow")
p center2('I love ruby') == 'e'
p center2('Launch School') == ' '
p center2('Launch') #== 'un'
p center2('Launchschool') == 'hs'
p center2('x') == 'x'

#Easy9

def greetings(array, hash)
  string = ""
  array.each_with_index {|el, i| i == array.length - 1 ? string << el : string << el << " " }
  "Hello #{string}! Nice to have a #{hash[:title]} #{hash[:occupation]} around!"
end 

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })

def twice(integer)
  int_chars = integer.to_s.chars
  halfway = int_chars.length/2
  int_chars[0, halfway] == int_chars[halfway..-1] ? integer : integer * 2
end 

p twice(1010)
p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
puts

def negative(num)
  num < 0 ? num : num * -1
end 

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0 

def sequence(num)
  1.upto(num).to_a
end 

p sequence(5)
p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
puts

def uppercase?(string)
  string.chars.each do |el|
    return false unless el == el.upcase
  end 
  true
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
puts 

def word_lengths(string)
  string.split(" ").map { |el| el <<  " #{el.length.to_s}" }
end  

p word_lengths("hello there how are you")
p word_lengths("cow sheep chicken")
p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []

puts 

#name swapping
def swap_name(string)
  string.insert(-1, ",")
  names = string.split
  names[0], names[1] = names[1], names[0]
  names.join(" ")
end 

puts swap_name("Danny Hilfiger")
p swap_name('Joe Roberts') == 'Roberts, Joe'


#sequence count
def sequence(count, start)

end 

def repeat(string, integer)
  counter = 1
  until counter < integer do
    puts "Hello"
    counter+= 1
  end 

end 

repeat("heloo", 3)

def sequence(count, seq_start)
  final = []
  count.times { |number| final << seq_start * (number+1)}
  final 
end 

puts
p sequence(4, 2)
p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

5.times {|i| puts i }

def get_grades(s1, s2, s3)
  grade_average = (s1+s2+s3)/3.0
  case grade_average
  when (90..100) then "A"
  when (80...90) then "B"
  when (70...80) then "C"
  when (60...70) then "D"
  else
     "F"
  end 
end 

p get_grades(95, 90, 93) #== "A"
p get_grades(50, 50, 95) #== "D"

def buy_fruit(g_list)
  final = []
  g_list.each do |el| el[-1].times {final << el[0]}
end
  final 
end 

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])
p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
["apples", "apples", "apples", "orange", "bananas","bananas"]


#medium1

def rotate_array(array)
copy = array.dup
last_digit = copy.shift
copy << last_digit
end 

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) #== ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

p x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]  

# def rotate_rightmost_digits(number, times)
#   number_array = []
#   final = []
#   number.to_s.reverse.chars.each {|el| number_array << el }
#   times.times {final << rotate_array(number_array)}
#   final 
# end 

def rotate_rightmost_digits(number, times)
  num_array = number.to_s.chars
  to_flip = num_array.slice!(-times..-1)
  num_array << rotate_array(to_flip)
  num_array.flatten.join.to_i
end 

p rotate_rightmost_digits(1234, 2)
p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) #== 735912
p rotate_rightmost_digits(735291, 4) #== 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

# def max_rotation(integer)
#   p num_array = integer.to_s.chars
#   i = num_array.length - 1
#   until i == 0 do 
#   final = rotate_rightmost_digits(integer, i)
#   p final 
#   i -= 1
#   end 
# final 
# end 

# p max_rotation(735291) #== 321579

require 'pry'

#1000 lights
def on_off(switches)
  lights_array = 1.upto(switches)
  on_off_array = Array.new(switches, false)
  light_truth_hash = lights_array.zip(on_off_array).to_h
  light_truth_hash_evens = light_truth_hash.select {|value| value.even?}
  light_truth_hash_odds = light_truth_hash.select {|value| value.odd?}
  i = 0 
  while i < light_truth_hash.length-1  
    if i == 0
      light_truth_hash.each_value {|light_truth| light_truth = true}
    elsif i > 0
      final = light_truth_hash.each.map do |key, value|
        value = !value if (key.odd? && i.even? && i > 0) || (key.even? && i.odd?)
      end
      
    end 
    i += 1
  end 
final 
end 

p on_off(6)