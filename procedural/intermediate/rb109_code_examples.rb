# frozen_string_literal: true

# Example 1
a = 'hello'

b = a

a = 'goodbye'

# Example 2

def example(str)
  i = 3
  loop do
    puts str
    i -= 1
    break if i == 0
  end
 end

example('hello')

# Example 3
a = 4
b = 2

loop do
  c = 3
  a = c
  break
end

puts a

puts b

# Example 4
a = 4
b = 2
2.times do |a|
  a = 5
  puts a
end

puts a
puts b

# Example 5
a = 'hello'
puts a # -> hello
puts a.object_id # -> 70368527757720 (this number will be different for you)

a.upcase!

puts a # -> HELLO
puts a.object_id # -> 70368527757720 (this number will be the same as the one above)

# Example 5
a = 'name'
b = 'name'
c = 'name'

# Are these three local variables pointing to the same object?

puts a.object_id
puts b.object_id
puts c.object_id

# And when we add these two lines of code... ?

a = c
b = a

puts a.object_id
puts b.object_id
puts c.object_id

# What about now?
a = 5
b = 5
c = 5

puts a.object_id
puts b.object_id
puts c.object_id

# Example 6
a = :dog
b = :dog
c = :dog

puts a.object_id
puts b.object_id
puts c.object_id

# Example 7
a = 'hello '
puts a
puts a.object_id

a += 'world'
puts a
puts a.object_id

# Example attached block ignored
def greetings
  puts 'Goodbye'
end

word = 'Hello'

greetings do
  puts word
end
