# frozen_string_literal: true

def all_substrings_2_or_more(string)
  substrings = []
  0.upto(string.length - 2) do |index|
    2.upto(string.length - index) do |length|
      substrings << string[index, length]
    end
  end
  substrings
end

p all_substrings_2_or_more('hello')

def prime?(int)
  return false if int < 2

  2.upto(int - 1).none? { |div| int % div == 0 }
end

p prime?(1)
p prime?(34)
p prime?(37)

def keep_alphabetical_chars(str)
  str.gsub(/[^a-zA-Z\s]/, '')
end

def keep_alphabetical_chars(str)
  str.scan(/[a-zA-Z\s]/).join
end

p keep_alphabetical_chars('My 123darling fi77led on 7he 400f with a11 h3r h3a4t')

# alg
# determine if a number is part of the fib series
# create an array of fib numbers
# init a fib_array with 1, 1 as elements
# from 0 up to the length of the given array - 2, push the return value of fib-1 + fib-2 to the fib array
# select elements out of the given array whose indexes are part of the fib series
# [1, 2, 3, 4, 5, 6] indexes 0 - 5
# select these elements, based on their indexes, if their indexes are included in the fib_array
# fib series: series of integers that starts with 1, 1, and every number afterward is the previous number + 2 numbers ago

def fib_index_select(array)
  fib_array = [1, 1]
  1.upto(array.length - 3) { fib_array << fib_array[-1] + fib_array[-2] }
  fib_array
  array.select.with_index { |_, i| fib_array.include?(i) }
end

p fib_index_select([1, 2, 3, 4, 5, 6])
# p fib_index_select(('a'..'z').to_a)
