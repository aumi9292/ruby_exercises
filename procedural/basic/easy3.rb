# searching 101
# final = []
# puts 'Enter the first number: '
# final << gets.chomp
# puts 'Enter the second number: '
# final << gets.chomp
# puts 'Enter the third number: '
# final << gets.chomp
# puts 'Enter the fourth number: '
# final << gets.chomp
# puts 'Enter the fifth number: '
# final << gets.chomp
# puts 'Enter the final number: '
# num = gets.chomp
# puts final.include?(num) ? "#{num} is in final" : "#{num} is not in final"

# Arithmetic Integer
# puts 'Enter the first number'
# num1 = gets.chomp.to_i
# puts 'Second number'
# num2 = gets.chomp.to_i
# puts output = <<MSG
# #{num1} + #{num2} = #{num1 + num2}
# #{num1} - #{num2} = #{num1 - num2}
# #{num1} * #{num2} = #{num1 * num2}
# #{num1} / #{num2} = #{num1 / num2}
# #{num1} % #{num2} = #{num1 % num2}
# #{num1} ** #{num2} = #{num1**num2}
# MSG

# counting the number of characters
# puts 'Please write something'
# to_count = gets.chomp
# puts "There are #{to_count.split.join('').length} characters in \"#{to_count}\""

# multiplying two numbers
def multiply(n1, n2)
  n1 * n2
end

p multiply(5, 3) == 15
p multiply([1, 1], 3)

# squaring an argument
def square(n)
  n**2
end

p square(5) == 25
p square(-8) == 64

# exclusive or
def xor?(n1, n2)
  # (n1 && !n2) || (n2 && !n1)
  n1 ^ n2
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

# odd lists
# def oddities(array)
#   array.each_with_index.map { |el, i| el if i.even? }.compact
# end

def oddities(array)
  array.select.with_index { |_el, i| i.even? }
end

p oddities([2, 3, 4, 5, 6]) #== [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(%w(abc def)) #== ['abc']
p oddities([123]) == [123]
p oddities([]) == []

# palindromic strings
def palindrome?(string)
  string == string.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

def palindrome_array?(array)
  array == array.reverse
end

arr = "madam i'm adam".split
num_array = '356653'.split
p palindrome_array?(num_array)

def pal_s_a?(input)
  input.reverse == input
end

p pal_s_a?('356653')

# real palindrome
def real_palindrome?(string)
  to_comp = string.downcase.chars.select { |el| ('a'..'z').cover?(el) || (0..9).cover?(el) }
  to_comp == to_comp.reverse
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false

# numbers palindrome
def pal_number?(num)
  num.to_s == num.to_s.reverse
end

p pal_number?(954_459)
