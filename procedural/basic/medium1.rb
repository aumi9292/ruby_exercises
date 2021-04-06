# frozen_string_literal: true

require 'pry'

# rotation pt 1
def rotate(array)
  final = []
  array.each_with_index do |el, i|
    final << el unless i.zero?
  end
  final << array[0]
end

x = [1, 2, 3, 4]
p rotate(x)
p x

p rotate([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate(%w[a b c]) == %w[b c a]
p rotate(['a']) == ['a']

x = 123_456

# rotation part 2
def rotate2(int, digit)
  int_arr = int.to_s.chars
  first = int_arr[0...-digit]
  to_rotate = int_arr[-digit..-1]
  (first + rotate(to_rotate)).join.to_i
end

p rotate2(x, 4)

p rotate2(735_291, 1) == 735_291
p rotate2(735_291, 2) == 735_219
p rotate2(735_291, 3) == 735_912
p rotate2(735_291, 4) == 732_915
p rotate2(735_291, 5) == 752_913
p rotate2(735_291, 6) == 352_917

# rotation part 3
def max_rotation(int)
  i = int.to_s.length
  until i == 1
    int = rotate2(int, i)
    i -= 1
  end
  int
end

def max2(int)
  i = 0
  int = int.to_s.chars
  str = ''
  loop do
    break if i == int.length

    int.push(int.slice!(i))
    str += int[i]
    i += 1
  end
  str
end

p max2(735_291)
p max2(1005)
p max_rotation(735_291) #== 321579
p max_rotation(735_291) == 321_579
p max_rotation(3) == 3
p max_rotation(35) == 53
# p max_rotation(1005) #== 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

# 1000 lights
def lights(n)
  initial = (1..n).map { false }

  i = 1

  loop do
    break if i > initial.length

    initial = initial.map.with_index { |switch, switch_index| ((switch_index + 1) % i).zero? ? !switch : switch }

    i += 1
  end

  initial.map.with_index { |light, index| (index + 1) if light }.select { |light| light.is_a?(Integer) }
end

p lights(1000)

# diamonds!
def top_half(int)
  1.step(int, 2) { |i| puts i == 1 ? tip(int) : empty_innards(i, int) }
end

def bottom_half(int)
  (int - 2).step(1, -2) { |i| puts i == 1 ? tip(int) : empty_innards(i, int) }
end

def empty_innards(i, int)
  ('*' + (' ' * (i - 2)) + '*').center(int)
end

def tip(int)
  '*'.center(int)
end

def cut_diamond(int)
  top_half(int)
  bottom_half(int)
end

cut_diamond(9)

# def minilang(str)
#   stack = []
#   register = 0
#   orders = str.split
#   orders.each do |current_order|
#     case current_order
#     when current_order.to_i.to_s == current_order then register = str.to_i
#     when 'PRINT' then puts register
#     when 'ADD' then register + stack.pop
#     when 'SUB' then register - stack.pop
#     when 'MULT' then register * stack.pop
#     when 'DIV' then register / stack.pop
#     when 'MOD' then register % stack.pop
#     when 'PUSH' then stack << register
#     when 'POP' then register = stack.pop
#     end
#   end
# end

def minilang(string)
  register = 0
  stack = []
  orders = string.split.map do |el|
    el.to_i.to_s == el ? el.to_i : el
  end
  orders.each do |order|
    if order == 'PRINT'
      puts register
    elsif order.is_a?(Integer)
      register = order
    elsif order == 'PUSH'
      stack << register
    elsif order == 'POP'
      register = stack.pop
    elsif order == 'ADD'
      register += stack.pop
    elsif order == 'SUB'
      register -= stack.pop
    elsif order == 'MULT'
      register *= stack.pop
    elsif order == 'DIV'
      register /= stack.pop
    elsif order == 'MOD'
      register = register % stack.pop
    end
  end
end

def minilang(string)
  register = 0
  stack = []

  orders = string.split.map do |el|
    el.to_i.to_s == el ? el.to_i : el
  end

  error_message = 'STACK_ERROR: NO_OPERAND ERROR'
  error = false

  orders.each do |order|
    puts register if order == 'PRINT'
    register = order if order.is_a?(Integer)
    stack << register if order == 'PUSH'
    if stack.empty? && %w[POP ADD SUB MULT DIV MOD].include?(order)
      error = true
      next
    end

    register = stack.pop if order == 'POP'
    register += stack.pop if order == 'ADD'
    register -= stack.pop if order == 'SUB'
    register *= stack.pop if order == 'MULT'
    register /= stack.pop if order == 'DIV'
    register %= stack.pop if order == 'MOD'
  end
  puts error_message if error
end

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
minilang('-3 PUSH 5 SUB PRINT')
minilang('4 PUSH 5 MULT PUSH 7 SUB PRINT')
minilang('3 PUSH 5 MOD PUSH 3 PUSH 7 PUSH 4 PUSH 5 MULT SUB ADD DIV PRINT')
minilang('4 ADD PRINT')

# word to digit
INTS = {
  'zero' => '0',
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9'
}.freeze

def word_to_digit(string)
  final_arr = string.split.map do |word|
    compare = word.gsub(/\./, '')
    if INTS.keys.include?(compare) && word != compare
      INTS[compare] + '.'
    elsif INTS.keys.include?(compare)
      INTS[compare]
    else
      word
    end
  end
  final_arr.join(' ')
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# fibonacci recursion
# looping
def fib(n)
  return 1 if n.between?(1, 2)

  fib(n - 1) + fib(n - 2)
end

p fib(6)
p fib(12) #== 144
p fib(20) == 6765

# fib part 2 procedural
# def fib(n)
#   arr = [1, 1]
#   return arr[n - 1] if n <= 2

#   2.upto(n - 2) do
#     new_num = arr.reduce(&:+)
#     arr << new_num
#   end
#   arr[n - 2]
# end

def fib(n)
  return 1 if n <= 2

  arr = [1, 1]
  i = 2
  loop do
    arr << arr[i - 1] + arr[i - 2]

    break if i == (n - 1)

    i += 1
  end
  arr.last
end

p fib(3)
p fib(4)
p fib(6)
p fib(12) #== 144
p fib(20) == 6765

# medium1 last digit fib
def last_digit_fib(nth)
  first = 1
  last = 1
  3.upto(nth) { first, last = [last, first + last] }
  last.to_s[-1].to_i
end

p last_digit_fib(20) #== 6765
p last_digit_fib(15)        # -> 0  (the 15th Fibonacci number is 610)
p last_digit_fib(20)        # -> 5 (the 20th Fibonacci number is 6765)
p last_digit_fib(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# p last_digit_fib(100_001)   # -> 1 (this is a 20899 digit number)
# p last_digit_fib(1_000_007) # -> 3 (this is a 208989 digit number)
# p last_digit_fib(123_456_789) # -> 4
