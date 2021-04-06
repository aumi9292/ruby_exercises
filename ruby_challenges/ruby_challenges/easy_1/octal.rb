# problem: given a String object that represents an octal number, return a base10 integer object.
# if invalid input is given, return integer 0

# decimal: 152 -- 2 * 10^0, 5 * 10^1, 1 * 10^2
# octal: 152 -- 2 * 8^0, 5 * 8^1, 1 * 8^2

# algorithm --given '152'
# return 0 if given invalid input
# otherwise, break the string into charactera ['1', '5', '2']
# converat all chars to digits [1, 5, 2]
# reverse array of digits [2, 5, 1]
# iterate over each digit, noting its index
# for each digit, exponent it by 10 * its index
# return the summed the array

# test implications
# define class Octal
# define Octal#initialize to take a string object

# define Octal#to_decimal
# return 0 if string.to_i.to_s != string
# return 0 if string.digits.any? are > 7

class Octal
  def initialize(octal)
    @octal = octal
    @digits = digitize(octal)
  end

  def to_decimal
    digits.instance_of?(Integer) ? digits : translate(digits)
  end

  private

  attr_reader :octal, :digits

  def translate(digits)
    digits.map.with_index { |el, idx| el * (8**(idx)) }.sum
  end

  def digitize(octal)
    return 0 if invalid_input(octal)
    octal.chars.reverse.map(&:to_i)
  end

  def invalid_input(str)
    invalid_digits(str) || invalid_octal(str)
  end

  def invalid_octal(str)
    str.to_i.digits.any? { |dig| dig > 7 }
  end

  def invalid_digits(str)
    str.chars.any? { |chr| chr.to_i.to_s != chr }
  end
end

p Octal.new('17').to_decimal
