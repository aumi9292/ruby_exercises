# Write a program that will take a string of digits and give you all the possible consecutive number series of length n in that string.
# test implications
# problem
# create a class called Series that takes one argument--a string of digits--and initializes a Series object with an instance variable @string_digit

# create a method, Series#slices() that
# takes one argument--an Integer that is the lengths of desired substrings to extract
# returns a two dimensional array, with inner arrays of substrings of the desired length
# method edge cases:
# should return ArgumentError if an integer passed to #slices is larger than the size of @string_digits
# should always return a two dimensional array--even if there is only one substring of the desired length (if length n == @string_digits.length)
# should not drop leading zeros in a string digit
# Series objects should only accept strings that contain all digits

# examples
# '01234'.slices(2) --> [[0, 1], [1, 2], [2, 3], [3, 4]]
# '1234'.slices(2) --> [[1, 2], [2, 3], [3, 4]]
# '000'.slices(2) --> [[0, 0], [0, 0]]

# data structures
# Series objects, String objects (@string_digits), Array objects (return value of calling #slices on a Series object)

# questions
# should inner arrays only be unique sets, e.g., '000' n = 2 [[0, 0]] or [[0, 0], [0, 0]]
# where should the validation for input into the ::new call on the Series class be to ensure only numeric strings are passed in as arguments? In a private helper method called in the initialize method?

# algorithm
# define Series class
# define initialize method that takes one argument
# validate the passed in object to make sure it is a String that only contains digits
# assign the object to an instance variable

# define Series#slices
# raise ArgumentError if passed an Integer object larger than the length of the calling Series object's @string_digits
# iterate over all digits in the string, from the first up to the length of the string - n   '1234'.slices(3) iterate over 1, 2
# at each of these characters/indexes, select n characters '123', '234'
# place these into their own arrays ['123'], ['234']
# push each inner array into a final array [['123'], ['234']]
# for each inner array,
# iterate over each character [['1', '2', '3'], ['2', '3', '4']]
# convert each character to an integer [[1, 2, 3], [2, 3, 4]]

class Series
  attr_reader :str_digits

  def initialize(str_digits)
    @str_digits = str_digits
  end

  def slices(int)
    raise ArgumentError if int > str_digits.length
    final = []
    0.upto(str_digits.length - int) do |index|
      final << str_digits[index, int].split('').map(&:to_i)
    end
    final
  end
end
