# 1
greeting = “hello world” if false

greeting
# Ruby will return nil for an uninitialized variable, it won't throw an undefined error

# 2A
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = 'one'
two = 'two'
three = 'three'

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
# one, two three--variables are unchanged after the method

# B
def mess_with_vars(_one, _two, _three)
  one = 'two'
  two = 'three'
  three = 'one'
end

one = 'one'
two = 'two'
three = 'three'

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
# one, two three--variables are unchanged after the method

# C
def mess_with_vars(one, two, three)
  one.gsub!('one', 'two')
  two.gsub!('two', 'three')
  three.gsub!('three', 'one')
end

one = 'one'
two = 'two'
three = 'three'

mess_with_vars(one, two, three)

puts "one is: #{one}" # two
puts "two is: #{two}" # three
puts "three is: #{three}" # one
# gsub! is a bang method, modifies the original object, which then remains modified outside of the method

# Q4
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split('.')
  return false unless dot_separated_words == 4
  until dot_separated_words.empty?
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  true
end
