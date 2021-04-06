# easy 1
# enumerable class creation
class Tree
  include Enumerable

  def each; end
end

def compute
  block_given? ? yield : "Does not compute."
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# find missing numbers
def missing(arr)
  arr[0].upto(arr[-1]).to_a.select { |el| !arr.include?(el) }
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

# divisors
# problem: from 1 up to the given number, check if given_num % int.zero?
def divisors(int)
  1.upto(int).each_with_object([]) { |el, obj| (int % el).zero? ? obj << el : obj }
end

def divisors2(int)
  lows = 1.upto((int**0.5).ceil)
  lows.reduce([]) { |acc, el| (int % el).zero? ? acc << el << (int / el) : acc }.uniq.sort
end
p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

# rot13
# given a string, translate the string so all characters are either + or - 13
# [a, b, c, d, e, f, g, ...]
# if the index is less than 13, add 13, otherwise, subtract 13
# split string into array of words
# split words into characters
# map over the characters, the return value of calling .index(char) +- 13
ALPHA = ('a'..'z').to_a
U_ALPHA = ('A'..'Z').to_a

def translate(char, alpha)
  index = alpha.index(char)
  index < 13 ? alpha[index + 13] : alpha[index - 13]
end

def correct_case(char)
  ALPHA.include?(char) ? translate(char, ALPHA) : translate(char, U_ALPHA)
end

def alpha_lookup(word)
  word.map { |char| ALPHA.include?(char.downcase) ? correct_case(char) : char }.join
end

def rot13(str)
  str.split.map(&:chars).map { |word| alpha_lookup(word) }.join(' ')
end

p rot13("Nqn Ybirynpr")
p rot13("Tenpr Ubccre")
p rot13("Nqryr Tbyqfgvar")
p rot13("Nyna Ghevat")
p rot13("Puneyrf Onoontr")
p rot13("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv")
p rot13("Wbua Ngnanfbss")
p rot13("Ybvf Unvog")
p rot13("Pynhqr Funaaba")
p rot13("Fgrir Wbof")
p rot13("Ovyy Tngrf")
p rot13("Gvz Orearef-Yrr")
p rot13("Fgrir Jbmavnx")
p rot13("Xbaenq Mhfr")
p rot13("Fve Nagbal Ubner")
p rot13("Zneiva Zvafxl")
p rot13("Lhxvuveb Zngfhzbgb")
p rot13("Unllvz Fybavzfxv")
p rot13("Tregehqr Oynapu")

# true for any?
def any?(arr)
  arr.each { |el| return true if yield(el) }
  false
end
p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |_value| true } == true
p any?([1, 3, 5, 7]) { |_value| false } == false
p any?([]) { |_value| true } == false

# true for all
def all?(arr)
  arr.each { |el| return false unless yield(el) }
  true
end

p all?([1, 3, 5, 6]) { |value| value.odd? } == false
p all?([1, 3, 5, 7]) { |value| value.odd? } == true
p all?([2, 4, 6, 8]) { |value| value.even? } == true
p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p all?([1, 3, 5, 7]) { |_value| true } == true
p all?([1, 3, 5, 7]) { |_value| false } == false
p all?([]) { |_value| false } == true

# true for none?
def none?(arr)
  all?(arr) { |el| !yield(el) }
end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |_value| true } == false
p none?([1, 3, 5, 7]) { |_value| false } == true
p none?([]) { |_value| true } == true

# true for one?

def one?(arr)
  count = 0
  arr.each do |el|
    count += 1 if yield(el)
    return false if count > 1
  end
  count == 1
end

puts
p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |_value| true }           # -> false
p one?([1, 3, 5, 7]) { |_value| false }          # -> false
p one?([]) { |_value| true }                     # -> false

# count items
def count(arr)
  arr.reduce(0) { |count, el| yield(el) ? count + 1 : count }
end

puts
p count([1, 2, 3, 4, 5]) { |value| value.odd? } == 3
p count([1, 2, 3, 4, 5]) { |value| value % 3 == 1 } == 2
p count([1, 2, 3, 4, 5]) { |_value| true } == 5
p count([1, 2, 3, 4, 5]) { |_value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2

# easy 2
def step(start, ending, step)
  step_count = 0
  while start < ending
    yield(start += (step * step_count))
    step_count += 1
  end
  start
end

p step(1, 10, 3) { |value| puts "value = #{value}" }

# custom zip
def zip(arr1, arr2)
  arr1.each_index.with_object([]) { |i, obj| obj << [arr1[i], arr2[i]] }
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

# map
def map(arr)
  arr.each_with_object([]) { |el, obj| obj << yield(el) }
end
p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |_value| true } == []
p map(['a', 'b', 'c', 'd']) { |_value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]
p map({ a: 1, b: 10, c: 100 }) { |_k, v| v * 2 }

# count
def count(*args)
  args.reduce(0) { |acc, el| yield(el) ? acc + 1 : acc }
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |_value| true } == 3
p count() { |_value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3

# drop while
def drop_while(arr)
  arr.each_index.with_object([]) do |i, obj|
    return (obj << arr[i..-1]).flatten unless yield(arr[i])
  end
end

puts
p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |_value| true } == []
p drop_while([1, 3, 5, 6]) { |_value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |_value| true } == []

# each with index

def each_with_index(arr)
  i = 0
  loop do
    yield(arr[i], i)
    i += 1
    break if i == arr.length
  end
  arr
end

def each_with_index(arr)
  i = 0
  arr.each do |el|
    yield(el, i)
    i += 1
  end
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]

# each_with_object

def each_with_object(arr, obj)
  arr.each { |el| yield(el, obj) }
  obj
end

result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
p result == [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
p result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
p result == {}

# max by
def max_by(arr)
  arr.sort!
  return nil if arr.empty?
  return arr[0] if arr.length == 1
  yielded = []
  arr.each { |el| yielded << yield(el) }
  i = 1
  max = arr[0]
  loop do
    max = arr[i] if yielded[i] > yielded[i - 1]
    i += 1
    break if i == arr.length
  end
  max
end

def max_by(arr)
  arr.reduce(arr[0]) { |start, val| yield(start) < yield(val) ? val : start }
end

puts
p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 }.nil?

# each cons pt 1

def each_cons(arr)
  arr[0...-1].each_index.with_object(nil) { |i, _obj| yield arr[i, 2] }
end

puts

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result.nil?
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result.nil?

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == { 'a' => 'b' }
p result.nil?

# each cons pt 2
def each_cons(arr, set)
  arr[0..-set].each_index { |i| yield set > 1 ? arr[i, set] : arr[i] }
  nil
end
puts
hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}
