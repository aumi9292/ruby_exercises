# how old is teddy?
# puts "What's your name?"
# name = gets.chomp
# name = 'Teddy' if name.empty?
# puts "#{name} is #{rand(20..200)} years old!"

# how big is the room
def room_area
  puts 'What the length of the room?'
  length = gets.chomp.to_i
  puts "What's the width of the room?"
  width = gets.chomp.to_i
  puts "The area of the room is #{width * length} square meters (#{width * length * 10.7639} square feet)."
end

# room_area

# tip calculator
def tip_calculator
  puts "What's the bill?"
  bill = gets.chomp.to_f
  puts 'What percent do you want to leave?'
  tip_percent = gets.chomp.to_f
  tip_amount = bill * (tip_percent * 0.01)
  total = tip_amount + bill
  puts "The tip is $#{format('%.2f', tip_amount)} and the total bill is $#{format('%.2f', (total + tip_amount))}"
end

# tip_calculator

# when will i retire
def retire_age
  puts 'How old are you?'
  age = gets.chomp.to_i
  puts 'At what age would you like to retire?'
  target_age = gets.chomp.to_i
  puts "It's #{Time.now.year}. You will retire in #{Time.now.year + (target_age - age)} "
end

# retire_age

# greeting a user
def greet_in_kind
  puts 'Name?'
  name = gets.chomp
  name[-1] == '!' ? puts("HELLO #{name.upcase}! WHY ARE WE SCREAMING") : puts("hi #{name}")
end

# greet_in_kind

# odd numbers
def odd_numbers
  1.step(99, 2) { |n| puts n }
end

# odd_numbers

# even numbers
def even_numbers
  puts (1..99).select(&:even?)
end

# even_numbers

# sum or product of consecutive numbers
def s_p
  puts 'Please enter an integer greater than 0'
  integer = gets.chomp.to_i
  puts "Enter 's' to compute the sum, 'p' to compute the product."
  operation = gets.chomp
  operation == 's' ? puts(1.upto(integer).reduce(:+)) : puts(1.upto(integer).reduce(:*))
end

s_p
