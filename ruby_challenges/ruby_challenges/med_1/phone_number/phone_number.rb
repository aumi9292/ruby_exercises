# problem: given a string with numbers and other symbols, return a clean string that is a valid number
# iterate through the string
# only select numbers 0-9
# return 0000000000 if number length is less than 10
# return 0000000000 if number length is greater than 11
# return number minus the first number if the number is 11 and the first is 1
# else return 0000000000 if the length is 11 and the first dig is not 1

# tests
# define a class PhoneNumber
# the initialize method should take an untouched string that is the given phone number

# define a method #number that can be called on an instance to return a clean number or 0000000000

# area_code instance method should return the first 3 digits of the clean str
# PhoneNumber#to_s should return a number with area code in ( ) and a - between the next 3 and last 4
class PhoneNumber
  INVALID = "0000000000"

  def initialize(num)
    @num = num
    @cleaned = remove_non_numbers
    @ten_cleaned = handle_10_or_11
  end

  def number
    valid? ? ten_cleaned : INVALID
  end

  def area_code
    ten_cleaned[0, 3]
  end

  def to_s
    ten_cleaned.dup.prepend('(').insert(4, ') ').insert(9, '-')
  end

  private

  attr_accessor :num, :cleaned, :ten_cleaned

  def handle_10_or_11
    valid_eleven? ? remove_country_code : cleaned
  end

  def valid?
    (cleaned.length == 10 || valid_eleven?) && given_includes_no_letters
  end

  def given_includes_no_letters
    !(num =~ /[a-zA-Z]/)
  end

  def valid_eleven?
    (cleaned.length == 11 && cleaned[0] == '1')
  end

  def remove_non_numbers
    num.gsub(/[^0-9]/, '')
  end

  def remove_country_code
    cleaned[1..-1]
  end
end
