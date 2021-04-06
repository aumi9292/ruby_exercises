require "pry"

nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

six_higher = nums.select {|num| num > 5}

six_odd = six_higher.select {|num| num.odd?}

puts six_odd

puts 

puts nums.push(11).unshift(0)

nums[-1] = 3

puts nums

no_dupes = nums.uniq

puts no_dupes

languages = {:Ruby => "1990s", Python: "1990s"}
puts languages

h = {a: 1, b: 2, c: 3, d: 4}

puts h.fetch(:b)
h.store(:e, 5)
puts h

large_h = h.reject {|k, v| v < 3.5}
puts large_h

hash = {v1: [1, 2, 3, 4], v2: [5, 6, 7, 8]}
aoh = [{v1: [1, 2, 3, 4], v2: [5, 6, 7, 8]}, {v1: [1, 2, 3, 4], v2: [5, 6, 7, 8]}]

puts aoh

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}



i = 0 
while i < contacts.length 
final = contacts.each do |person|
  p person[1][:email] = contact_data[i][0]
  p person[1][:address] = contact_data[i][1]
  p person[1][:phone] = contact_data[i][2]
end 
i += 1
end 
puts final 

p final 

# def contact_filler(contact_array, contact_hash)
# associated = contact_hash.each do |person| 
#   # person[:email] = contact_array[0][0]
#   # person[:address] = contact_array[0][1]
#   # person[:phone] = contact_array[0][2]
#   puts person
# end 
# associated
# end 

# puts contact_filler(contact_data, contacts)

# hash = {}
# associated = [:email, :address, :phone].zip(contact_data[0])
#  associated.each do |inner_array|
#   hash[inner_array[0]] = inner_array[1]
# end 

# p associated
# puts hash

# final = contacts.each do |k, v|
#   v = hash
# end 

# puts final 


arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

def picky_letters(arr)
  arr.delete_if do |word|
    word.start_with?('s') || word.start_with?('w')
  end 
  arr
end 

puts picky_letters(arr)

a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

def one_word_elements(array)
  final = array.map { |words| words.split(" ") } 
  final.flatten
end 

p one_word_elements(a)

contact_data2 = ["joe@email.com", "123 Main st.", "555-123-4567"]
contact_data3 = [["joe@email.com", "123 Main st.", "555-123-4567"], ["ausyb@email.com", "666 Main st.", "6767677"]]
contact_data4 = [["joe@email.com", "123 Main st.", "555-123-4567"], ["ausyb@email.com", "666 Main st.", "6767677"], ["celiawitz@com", "4280 east iowa", "99999999"]]
contacts2 = {"Joe Smith" => {}, "Austin Miller" => {}, "Celia Horowitz" => {}}

zipped = [:email, :address, :phone].zip(contact_data2)
p zipped

def match_info(contact_data, contacts)
  return_hash = {}
  name = contacts.keys {|key| key}
  name.each do |name| 
  return_hash[name] = {}
  i = 0 
  while i < contact_data.length do 
    zipped = [:email, :address, :phone].zip(contact_data[i])
    return_hash[name][zipped[i][0]] = zipped[i][1]
    i += 1
  end 
  end 
  return_hash
end 

# associated = contacts2.each_value {|value| value[zipped[0][0]] = zipped[0][1]}
# p associated
# i= 0 
# while i < contact_data2
#   contact_data2[i].shift

puts match_info(contact_data4, contacts2)

# a = 7
# def my_value(b)
#   b+=10
# end

# puts my_value(a)
# puts a

# arr = [1, 2, 3]
# arr.each {|el| a = el}
# puts arr

# a = 7
# array = [1, 2, 3]

# array.each do |a|
#   a += 1
# end

# puts a
# puts array

# a = 7
# array = [1, 2, 3]

# def my_value(ary)
#   ary.each do |b|
#     a += b
#   end
# end

# puts my_value(array)

loop do
  puts "hi"
  break
end

loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'
    break
  end
  break 
end

puts 'This is outside all loops.'

i = 1
loop do 
  
  puts "Number of iterations: #{i}"
  break if i > 4
  i += 1
  
end 

# loop do 
#   puts "Should I stop looping?"
#   answer = gets.chomp
#   break if answer == "yes"
# end 

say_hello = true
i = 0 

while say_hello
  puts 'Hello!'
  i += 1
  say_hello = false if i > 5
end

n = 0 
while n < 5
  puts rand(1..100)
  n += 1
end 

count = 10
r_count = 1 
until count == 0
  puts r_count
  r_count += 1
  count -= 1
end

numbers = [7, 9, 13, 25, 18]
output_numbers = []
i = 0 

until numbers.length == output_numbers.length
  output_numbers << numbers[i] * 2 
  i += 1
end 

puts output_numbers

for i in 1..100
  puts i if i.odd? 
end

friends = ['Sarah', 'John', 'Hannah', 'Dave']

for friend in friends 
  puts "Hi #{friend}!"
end 

count = 1

loop do
  count.odd? ? puts("#{count} is odd!") : puts("#{count} is even!")
  count += 1
  break if count > 5 
end

loop do
  number = rand(100)
  puts number
  break if number >= 0 && number <= 10 
end



loop do 
  process_loop = [true, false].sample
  if process_loop
    puts "The loop was processed!"
    break 
  else 
    puts "The loop wasn't processed"
  end 
end 

# loop do
#   puts 'What does 2 + 2 equal?'
#   answer = gets.chomp.to_i
#   if answer == 4
#     puts "That's correct!"
#     break
#   else 
#     puts "Nope, try again"
#   end 
# end

# numbers = []

# loop do
#   puts 'Enter any number:'
#   input = gets.chomp.to_i
#   numbers << input
#   break if numbers.length == 5
# end
# puts numbers

names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do 
  puts names.pop()
  break if names.length == 0 
end 

5.times do |index|
  puts index
  break if index == 2
end

number = 0

until number == 10
  number += 1
  next if number.odd? 
  puts number
end

number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)
  if number_a == 5 || number_b == 5
    puts "A = #{number_a}, b = #{number_b}"
    puts "Reached 5!"
    break 
  end 
end

loop do
  number_a += rand(2)
  number_b += rand(2)
  if number_a == 5 || number_b == 5
    puts "A = #{number_a}, b = #{number_b}"
    puts "Reached 5!"
    break 
  end 
end

def greeting
  puts 'Hello!'
end

number_of_greetings = 2

while number_of_greetings > 0 
greeting()
number_of_greetings -= 1
end 

def repeater()
  puts "Type something"
  input = gets.chomp
  puts input 
end 

def age_in_months()
  puts "Age in years?"
  age = gets.chomp.to_i
  puts age*12
end 

# age_in_months

def print_something 
  puts "Print something? (y/n)"

  loop do 
    response = gets.chomp.downcase
    puts "Invalid response, please say 'y' or 'n'" unless response == "y" || response == "n"
    if response == "y" 
      puts "Something, HA"
      break 
    elsif response == 'n' 
      break 
    end 
  end 
    
end 

# print_something

def ls_printer
  loop do 
    puts "How many lines would you like (enter a number 3 or more)"
    number_of_prints = gets.chomp.to_i
    if number_of_prints >= 3
      number_of_prints.times {puts "Launch school is cool"}
      break 
    else 
      puts "not enough, try again pleaseee"
    end 
  end 
end 

# ls_printer

def enter_password
  p_word = "secreT"
  loop do 
    puts "Enter password"
    attempt = gets.chomp
    if attempt == p_word
      puts "Welcome, Bruce Wayne"
      break 
    else 
      puts "Incorrect, try again please"
    end 
  end 
end 

# enter_password

PASSWORD = "secret"
USERNAME = "a_miller"
def username_password
  i = 0 
  loop do 
    puts "Enter username"
    u_name = gets.chomp.downcase
    puts "Enter password"
    p_word = gets.chomp.downcase
    if u_name == USERNAME && p_word == PASSWORD
      puts "Welcome #{USERNAME}"
      break 
    else 
      puts "Incorrect, try again"
      i += 1
      if i == 3 
        puts "too many attempts, you're out"
        break 
      end 
    end 
  end 
  
end 

# username_password



def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

def ruby_div
  loop do 
    puts "Enter numerator"
    numerator = gets.chomp 
    puts "Enter denominator"
    denominator = gets.chomp
    if valid_number?(numerator) && valid_number?(denominator) && denominator.to_i != 0
      puts "#{numerator} / #{denominator} is #{numerator.to_f/denominator.to_i}"
      break 
    else 
      puts "invalid input. integers greater than 0 allowed"
    end 
  end 
end 

# ruby_div

#ls is cool pt 2

# def ls_printer2
#   loop do 
#     puts "How many lines would you like (enter a number 3 or more)"
#     number_of_prints = gets.chomp.to_i
#     # if number_of_prints >= 3
#       number_of_prints.times {puts "Launch school is cool"}
#       next
#       break if number_of_prints.downcase == "q"
#     # else 
#       # puts "not enough, try again pleaseee"
#     # end 
#   end 
# end 

# ls_printer2

def ls_printer2
  loop do 
    puts "How many lines would you like (enter a number 3 or more)"
    number_of_prints = gets.chomp
     if number_of_prints.to_i >= 3
      number_of_prints.to_i.times {puts "Launch school is cool"}
     elsif number_of_prints.to_s.downcase == 'q'
      break
    else 
       puts "not valid input, try again pleaseee"
     end 
  end 
end 

# ls_printer2

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def opposite_numbers
  loop do 
   puts "Enter two numbers for this program, one positive, one negative, in any order. Please enter the first number now: "
    num1 = gets.chomp.to_i
    puts "Now enter your second number: "
    num2 = gets.chomp.to_i
    if (num1 < 0 || num2 < 0) && (num1 > 0 || num2 > 0)
      puts "Ah, your two numbers add to create #{num1 + num2}. Good work."
      break
    else 
      puts "Invalid entries, try again please." 
    end 
  end 
end 

# opposite_numbers

def print_me
  puts "I'm within the method!"
end 

# print_me

def print_2
  "I'm the return value"
end 

# puts print_2

def hi
  "Hello"
end 

def world
  "world"
end 

puts hi, world
puts "#{hi} #{world}"

def greet
  # hi + " " + world
  "#{hi} #{world}"
end 

puts greet

def car(make, model)
   puts "#{make.capitalize} #{model.capitalize}"
end 

car("toyota", "corolla")
daylight = [true, false].sample

def time_of_day(boolean)
  puts boolean ? "It's daytime!" : "it's dark"
end 

time_of_day(daylight)

def dog(name)
  name
end

def cat(name)
  name
end

puts "The dog's name is #{dog('Spot')}."
puts "The cat's name is #{cat('Ginger')}."

def assign_name(name='Bob')
  name
end 

puts assign_name('Kevin') == 'Kevin'
puts assign_name == 'Bob'

def add(n1, n2)
  n1+n2
end 
def multiply(n1, n2)
  n1*n2
end 

puts add(2, 2) == 4
puts add(5, 4) == 9
puts multiply(add(2, 2), add(5, 4)) == 36

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

def name(array)
  array.sample
end 

def activity(array)
  array.sample
end 

def sentence(word1, word2)
  "#{word1} is #{word2} all the time these days!"
end 

puts sentence(name(names), activity(activities))

# def meal
#   puts 'Dinner'
#   return 'Breakfast'
# end

# meal 
# puts meal

def meal
  'Dinner'
  puts 'Dinner'
end

# p meal
puts meal

def count_sheep
  5.times do |sheep|
    sheep
  end
end

puts count_sheep

#this syntax of conditions is called statement modifiers
sun = ['visible', 'hidden'].sample
puts "The sun is so bright!" if sun == 'visible'
puts "The clouds are blocking the sun!" unless sun == 'visible'

boolean = [true, false].sample

puts boolean ? "I'm true!" : "I'm false!"

#with puts inside ternary commands--
puts boolean ? puts("I'm true!") : puts("I'm false!")


stoplight = ['green', 'yellow', 'red'].sample

case stoplight
when 'green'
  puts "GO!"
when 'yellow'
  puts "speed up!"
when 'red'
  puts "stop!!!"
end 

if stoplight == 'green'
  puts 'Go!'
elsif stoplight == 'yellow'
  puts 'Slow down!'
else
  puts 'Stop!'
end

status = ['awake', 'tired'].sample

order = if status == 'awake'
  "be productive"
else 
   "go to sleep!"
end 

puts order

number = rand(10)

if number == 5
  puts '5 is a cool number!'
else
  puts 'Other numbers are cool too!'
end

stoplight = ['green', 'yellow', 'red'].sample

var = case stoplight
when 'green' then 'Go!' 
when 'yellow' then 'Slow down!' 
when "red" then 'Stop!' 
end

puts var

string = String.new("hello") 

p string 

puts "It's now 12 o'clock."
puts %Q(hi there's a \"folksie\")

name = 'Roger'
puts "RoGeR".downcase == name.downcase

puts "Hello #{name}!"

first_name = 'John'
last_name = 'Doe'

full_name = "#{first_name} #{last_name}"
p full_name

state = 'tExAs'
puts state
puts state.capitalize

greeting = 'Hello!'
greeting.sub!(/Hello!/, "Goodbye")
puts greeting

alphabet = 'abcdefghijklmnopqrstuvwxyz'
p alphabet.split("")

words = 'car human elephant airplane'
plurals = words.split(" ").each {|word| word << 's'}
puts plurals 

colors = 'blue pink yellow orange'
puts colors.include?('yellow')
puts colors.include?('purple')

pets = ['cat', 'dog', 'fish', 'lizard']
fish = pets.select {|pet| pet == 'fish'}
puts "I have a pet #{fish[0]}!"
my_pets = pets[2, 2]
puts my_pets
puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}!"

my_pets.pop()
my_pets << pets[1]
p my_pets
puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}!"

colors = ['red', 'yellow', 'purple', 'green']
colors.each {|color| puts "I'm the color #{color}!"} 

numbers = [1, 2, 3, 4, 5]
doubled = []
numbers.each {|n| doubled << n*2}
p doubled

numbers = [5, 9, 21, 26, 39]
div_by_3 = numbers.select {|n| n%3 == 0 }
puts div_by_3

favorites = [['Dave', 7], ['Miranda', 3], ['Jason', 11]]
flat_favorites = favorites.flatten
p flat_favorites

array1 = [1, 5, 9]
array2 = [1, 9, 5]
puts array1 == array2

car = Hash.new
car = {type: "sedan", color: "blue", mileage: 80_000}

car[:year] = 2003
car.delete(:mileage)
puts car
puts car.select {|kv| kv == :color}
puts car[:color]
puts car.fetch(:color)

numbers = {
  high:   100,
  medium: 50,
  low:    10
}

numbers.each {|k, v| puts "A #{k} number is #{v}."}

half_numbers = numbers.map {|k, v| v/2}
p half_numbers

low_numbers = numbers.select! { |k, v| v < 25 }
puts low_numbers
p numbers

cars = {car: {type: "sedan", color: "blue", year: 2003}, truck: {type: "pick-up", color: "red", year: 1998}}

p cars

nested_car = [[:type, "sedan"], [:color, "blue"], [:mileage, 80_000]]
p nested_car

sunshine = ['true', 'false'].sample
puts sunshine == true

def predict_weather
  sunshine = ['true', 'false'].sample

  if sunshine == 'true'
    puts "Today's weather will be sunny!"
  else
    puts "Today's weather will be cloudy!"
  end
end

predict_weather

balance = 0

january = {
  income: [ 1200, 75 ],
  expenses: [ 650, 140, 33.2, 100, 26.9, 78 ]
}

february = {
  income: [ 1200 ],
  expenses: [ 650, 140, 320, 46.7, 122.5 ]
}

march = {
  income: [ 1200, 10, 75 ],
  expenses: [ 650, 140, 350, 12, 59.9, 2.5 ]
}

def calculate_balance(month)
  plus  = month[:income].sum
  minus = month[:expenses].sum

  plus - minus
end

[january, february, march].each do |month|
  balance += calculate_balance(month)
end

puts balance

colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']

colors.shuffle!
things.shuffle!

i = 0
loop do
  break unless colors[i] && things[i] 

  if i == 0
    puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
  else
    puts 'And a ' + colors[i] + ' ' + things[i] + '.'
    puts i 
  end

  i += 1
end

puts colors.length 
puts things.length

def digit_product(str_num)
  digits = str_num.chars.map { |n| n.to_i }
  product = 1

  digits.each do |digit|
    product *= digit
  end

  product
end

digit_product("1, 4, 3, 2, 5")


player = { strength: 10, dexterity: 10, charisma: 10, stamina: 10 }

# Then the player picks a character class and gets an upgrade accordingly.

character_classes = {
  warrior: { strength:  20 },
  thief:   { dexterity: 20 },
  scout:   { stamina:   20 },
  mage:    { charisma:  20 }
}

puts 'Please type your class (warrior, thief, scout, mage):'
input = gets.chomp.downcase.to_sym

player.merge!(character_classes[input]) {|k, v1, v2| v1 + v2}

puts 'Your character stats:'
puts
puts player

# a = {first: 1, second: 2}
# b = {first: 1}
# a.merge!(b) {|k, v1, v2| v1 + v2 }
# puts a 

