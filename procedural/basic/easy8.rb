# frozen_string_literal: true

# sum of sums
def sum_of_sums(array)
  array = array.clone
  final = 0
  until array.empty?
    array.each { |el| final += el }
    array.pop
  end
  final
end

p sum_of_sums([3, 5, 2]) #== 3 + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == 1 + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

# mad libs
def mad_lib
  puts 'Enter a noun: '
  noun = gets.chomp
  puts 'Enter a verb: '
  verb = gets.chomp
  puts 'Enter an adjective: '
  adjective = gets.chomp
  puts 'Enter an adverb: '
  adverb = gets.chomp
  puts "One fine morning, a crazy fat #{noun} decided to #{verb} #{adverb}. It was #{adjective}."
end

# mad_lib

# leading substrings
def substrings_at_start(string)
  final = []
  counter = 0
  arr = string.chars
  until counter == arr.length
    final << arr.slice(0..counter).join
    counter += 1
  end
  final
end

p substrings_at_start('abc') #== %w[a ab abc]
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == %w[x xy xyz xyzz xyzzy]

# all substrings
def substrings(string)
  counter = 0
  final = []
  until counter == string.length
    final += substrings_at_start(string[counter..string.length])
    counter += 1
  end
  final
end

p substrings('abcde') #== %w[
# a ab abc abcd abcde
# b bc bcd bcde
# c cd cde
# d de
# e
# # ]

# palindromic substrings
def palindromes(string)
  substrings(string).select { |el| el.length > 1 && el == el.reverse && el.match(/[a-zA-Z1-9]/) }
end

p palindromes('abcd') == []
p palindromes('madam') #== %w[madam ada]
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == %w[
  nittin itti tt ss settes ette tt
]
# fizzbuzz
def fizzbuzz(start, limit)
  start.upto(limit) do |n|
    if n % 3 == 0 && n % 5 == 0
      puts 'Fizzbuzz'
    elsif n % 3 == 0
      puts 'Fizz'
    elsif n % 5 == 0
      puts 'Buzz'
    else
      puts n
    end
  end
end

fizzbuzz(1, 45)

# double char p 1
def repeater(string)
  string.chars.map { |el| el * 2 }.join
end
p repeater('Hello') == 'HHeelllloo'
p repeater('Good job!') #== 'GGoooodd  jjoobb!!'
p repeater('') == ''

# double char p 2

def double_consonants(string)
  final = string.chars.map do |el|
    if %w[a e i o u].include?(el)
      el
    elsif ('a'..'z').include?(el.downcase)
      el * 2
    else
      el
    end
  end
  final.join
end

p double_consonants('String') #== 'SSttrrinngg'
p double_consonants('Hello-World!') == 'HHellllo-WWorrlldd!'
p double_consonants('July 4th') #== 'JJullyy 4tthh'
p double_consonants('') == ''

# convert number to reversed array of digits
def reversed_number(int)
  final = []
  until int <= 0
    int, to_push = int.divmod(10)
    final << to_push
  end
  final.join.to_i
end

p reversed_number(12_345) #== 54_321
p reversed_number(12_345) == 54_321
p reversed_number(12_213) #== 31_221
p reversed_number(456) == 654
p reversed_number(12_000) == 21 # No leading zeros in return value!
p reversed_number(12_003) == 30_021
p reversed_number(1) == 1

# get middle char
def center_of(string)
  middle = string.length / 2
  if string.length.odd?
    string.slice(middle)
  else
    string.slice(middle - 1, 2)
  end
end

p center_of('I love ruby') #== 'e'
p center_of('Launch School') == ' '
p center_of('Launch') #== 'un'
p center_of('Launchschool') #== 'hs'
p center_of('x') == 'x'
