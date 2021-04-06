# frozen_string_literal: true

# major conceptual stumbling blocks beginners experience coding

# reading ruby's syntax--ruby has a lot of syntactical sugar that hides the underlying structures
puts 'hello'

def str
  'yo'
end

str = 'a string'

p str

# where does this code come from? e.g., puts
# Ruby has the core API and standard API. All methods are a part of the core API. They are organized into classes. Kernel--one of the most important modules in Ruby

# standard classes aren't used as frequently, to avoid bloat--must require modules/classes from standard library

# code always comes from somewhere--other loaded files (defined classes, etc.)

# local variable scoping rules
arr = [1, 2, 3, 4]
counter = 0
sum = 0

loop do
  sum += arr[counter]
  counter += 1
  break if counter == arr.size
end

p sum

# demos that local variables initialized in outer scope are accessible in inner scopes, like in the do..end block
# if a variable is initialized in inner scopes, it's not accessible in outer scope

# pass by reference and pass by value--major point of confusion when working with any language--fundamental skill needed to craft code

# Line 1 is where the param method local variable is initialized and assigned to the object that the passed in argument is bound to

# If a parameter is reassigned, it is no longer pointing to the same object as the passed in argument, but a new object

# destructive method--affects the caller, returns the same object, but modified. Does not return a new object, returns the same object

# variables as pointers--used everywhere, including when passing an argument into a method

# case statements
# case statements use reserved words case, when, else, end--first define the case (case = var_name), then evaluate the value of case (when 5) and operations to complete if the evaluation is truthy (e.g., puts "a is 5")
a = 99
b = nil
b = case a
    when 0..2 then false
    when 3..6 then true
    else
      a
    end

puts b

def recursive_countdown(n)
  if n <= 0
    puts n
  else
    puts n
    recursive_countdown(n - 1)
  end
end

recursive_countdown(10)

def loop_countdown(n)
  until n == 0
    puts n
    n -= 1
  end
end

loop_countdown(10)

# part 3

# variables are pointers--they are not objects
# how do you know if a method will mutate an argument--if operation inside the method invokes a destructive call before any reassignment. Reassignment before destructive call, then the bond between arg and param are broken

# variables are not objects--they point to objects

# if a variable is initialized and assigned to the object pointed to by an already existing variable, it does not create a new object
a = 'hi'
b = a
a += b # a is reassigned to a new object, it is creating a new object

# classes are objects too, but this is deeper model that will develop later

# reverse versus reverse! -- destructive action being called on the object, so all variables pointing to that object see the change

# collections

# arrays, hashes, strings
# data structure/collection: structure that holds data
# collection: type of data structure that refers to array, hash, string--multiple items in it. "" [] {}
# array: series of ordered elements, elements are retrievable by index/position
# hash: series of key value pairs (dictionary) of unique keys, values can be accessed by keys

# do not assume order in a hash. In arrays, order matters

# symbols are immutable-- :a is the key
# hash retrieval
hsh = { a: 1 }
# p hsh.fetch('a')
# symbols--immutable strings

a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
counter = 0
loop do
  puts a[counter]
  counter += 1
  break if counter == a.length
end

a.each { |n| puts n }
# block is being passed in to the each method call as an argument.

# each executes the block for each element in the collection

# blocks are chunks of code that can be passed into the method

# difference between the loop and the each call--loop returns nil, each returns the original array

# uniq method is not destructive, the uniq bang method (uniq!) is a different, destructive method

a.unshift(1)
p a

final = a.select(&:odd?)
p final

# select returns a new array depending on the criteria specified in the block
# more precise:
# select returns a new array of elements for which the passed in block evaluates to true

# select returns a new array based on the block's return value. If the block's return value evaluates to true, the element is included in the new array returned by select

# select cares about the truthiness of the reurn values of the block

incremented = a.map { |el| el + 1 }
p incremented
# map returns a new array of equal length to the caller. Elements in the new array are return values of the block for each element that's passed in

hsh = { a: 1, b: 2, c: 3, d: 4 }
p hsh[:b]

hsh[:e] = 5
hsh.store(:f, 6)
p hsh
hsh.each { |k, v| }

# Enumerable is a module mixed in to arrays and hashes--lots of collection traversal methods in enumerables

advice = 'Few things in life are as important as house training your pet dinosaur.'
advice_first = advice.index('imp')
p advice_first
p advice.slice(0...advice_first)
p advice

statement = 'The Flintstones Rock!'
p statement.count('t')

title = 'Flintstone Family Members'
p title.center(40)

i = 0
loop do
  puts (' ' * i) + 'The flinstones rock!'
  i += 1
  break if i == 10
end

a = 'Bob'

5.times do |_x|
  a = 'Bill'
end

p a

arr1 = %w[a b c]
arr2 = arr1.dup
arr2.map!(&:upcase)

puts arr1
puts arr2

# def fix(value)
#   value[1] = 'x'
#   value
# end

# s = 'abc'
# t = fix(s)

# def a_method(string)
#   string << ' world'
# end

# b = 'hello'
# a_method(b)

# p b

def add_name(arr, name)
  arr = arr << name
end

names = %w[bob kim]
add_name(names, 'jim')
puts names

array = [1, 2, 3, 4, 5]

final = array.select do |num|
  puts num if num.odd?
end

p final

a = 'hello'

p [1, 2, 3].map { |_num| a }

def test
  puts 'written assessment'
end

var = test
p var
if var
  puts 'test time'
else
  puts 'interview'
end

def change_me(str)
  arr = str.split
  final = arr.map { |el| el == el.reverse ? el.upcase : el }.join(' ')
end

p change_me('We will meet at noon') == 'We will meet at NOON'
p change_me('No palindromes here') == 'No palindromes here'
p change_me('') == ''
p change_me('I LOVE my mom and dad equally') == 'I LOVE my MOM and DAD equally'

# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# 1. init final array
# 2. split string into array of characters
# 3a. init outer_counter and assign to 0
# 3. init a counter variable, assign to 2
# 3b. starting at the first character, init a variable to represent the first substring, arr[0, 2] (arr[0, counter])
# 4. check that substring to see if it's a palindrome
# 5. if it is, push to final array
# 6. increment the counter, return to step 3b
# 7. break the inner loop if inner_counter == arr.length - 2
# 8. increment the outer counter,

def palindrome_substrings(str)
  final = []
  return final if str.length <= 1

  arr = str.split('')
  starting_character = 0
  loop do
    substring_end = 2
    loop do
      substring = arr[starting_character, substring_end].join
      final << substring if substring == substring.reverse
      substring_end += 1
      break if substring_end == arr.length - starting_character
    end
    starting_character += 1
    break if starting_character == str.length - 2
  end
  final
end

puts 'hello'
p palindrome_substrings('supercalifragilisticexpialidocious') == ['ili']
p palindrome_substrings('abcddcbA') == %w[bcddcb cddc dd]
p palindrome_substrings('palindrome') == []
p palindrome_substrings('') == []
