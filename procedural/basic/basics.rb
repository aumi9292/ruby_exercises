# # string: list of characters in a specific sequence, surrounded by double or single quotes in Ruby. 
# puts "The man said 'hello'"
# puts 'The man said "hello"'
# puts "The man said \'hello\'"

# a = 'ten'

# puts "my favorite number is #{a}"
# puts :hello

puts "Austin".concat(" ").concat("Miller")
array = []
number = 1234
first = number/1000
second = number%1000/100
third = number%100/10
fourth = number%10
array << first << second << third << fourth

puts array

movie_dates = []
movie_hash = {Jaws: 1970, HP1: 1999, Matrix: 1991, LOTR3: 2003}
puts movie_hash[:Jaws], movie_hash[:HP1], movie_hash[:Matrix], movie_hash[:LOTR3]

puts ""

movie_dates << movie_hash[:Jaws] << movie_hash[:HP1] << movie_hash[:Matrix] << movie_hash[:LOTR3]
puts movie_dates

puts ""

movie_dates.each {|movie| puts movie}

puts ""

i = 0 
while i < movie_dates.length do 
  puts movie_dates[i]
  puts "This is from the while loop"
  i += 1 
end 

# number 5
fact_5 = 5*4*3*2*1
puts fact_5
fact_6 = 6 * fact_5
puts fact_6
fact_7 = 7 * fact_6
puts fact_7
fact_8 = 8 * fact_7
puts fact_8

#6
def square(num)
  num ** 2 
end 

puts square(2.5)
puts square(2.6)
puts square(2.7)