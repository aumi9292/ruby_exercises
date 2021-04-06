loop do
  puts 'Just keep printing...'
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

iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  iterations += 1
  break if iterations == 6
end

# loop do
#   puts 'Should I stop looping?'
#   answer = gets.chomp
#   break if answer == 'yes'
# end

say_hello = true
i = 0
while say_hello
  puts 'Hello!'
  i += 1
  say_hello = false if i == 5
end

numbers = []

numbers << rand(0..99) while numbers.length < 5

p numbers

count = 1

until count > 10
  puts count
  count += 1
end

numbers = [7, 9, 13, 25, 18]
i = 0
until i == numbers.length
  puts numbers[i]
  i += 1
end

for i in 1..100
  puts i if i.odd?
end

friends = %w(Sarah John Hannah Dave)
for friend in friends
  puts "Hello #{friend}!"
end

count = 1

loop do
  count.even? ? puts("#{count} is even!") : puts("#{count} is odd!")

  count += 1
  break if count > 5
end

loop do
  number = rand(100)
  puts number
  break if (1..10).cover?(number)
end

loop do
  process_the_loop = [true, false].sample
  process_the_loop ? puts('Loop processed!') : puts('not today')
  break
end

# loop do
#   puts 'What does 2 + 2 equal?'
#   answer = gets.chomp.to_i
#   if answer == 4
#     puts 'right!'
#     break
#   else
#     puts 'wrong'
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

names = %w(Sally Joe Lisa Henry)
i = 0

loop do
  puts names[i]
  i += 1
  break if i == names.length
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

  next unless number_a == 5 || number_b == 5
  puts '5 was reached!'

  break
end

def greeting
  puts 'Hello!'
end

number_of_greetings = 2

i = 0
loop do
  greeting
  i += 1
  break if i == number_of_greetings
end
