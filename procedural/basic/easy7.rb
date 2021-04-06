# frozen_string_literal: true

# combine two lists

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

def interleave(arr1, arr2)
  final = []
  arr1.each_index { |i| final << arr1[i] << arr2[i] }
  final
end

p interleave([1, 2, 3], %w[a b c]) #== [1, 'a', 2, 'b', 3, 'c']

# lettercase counter
def letter_case_count(string)
  final = { lowercase: 0, uppercase: 0, neither: 0 }
  string.split('').each do |el|
    final[:neither] += 1 unless ('a'..'z').include?(el.downcase)
    final[:lowercase] += 1 if el.downcase == el && ('a'..'z').include?(el.downcase)
    final[:uppercase] += 1 if el.upcase == el && ('a'..'z').include?(el.downcase)
  end
  final
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') #== { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# capitalize words
def word_cap(string)
  final = string.split.map do |word|
    word[0].upcase + word[1..-1].downcase
  end
  final.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# swap case
def swapcase(string)
  arr = string.chars.map do |char|
    if char == char.downcase
      char.upcase
    else
      char.downcase
    end
  end
  arr.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# staggered caps
def staggered_case(string)
  final = []
  string.chars.each_with_index do |char, index|
    final << char.upcase if index.even?
    final << char.downcase if index.odd?
  end
  final.join
end

def staggered_map(string, order = 0)
  string.chars.map.with_index { |el, i| (i + order).even? ? el.upcase : el.downcase }.join
end

puts
p staggered_map('I Love Launch School!', 1) #== 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# staggered caps part 2
def staggered_case(string)
  counter = 0
  final = string.chars.map do |el|
    counter += 1 if ('a'..'z').include?(el.downcase)
    counter.odd? ? el.upcase : el.downcase
  end
  final.join
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# multiplicative average
def show_multiplicative_average(array)
  puts format('The result is %.3f', (array.reduce(&:*).to_f / array.length))
end

show_multiplicative_average([5, 10])
show_multiplicative_average([6])
show_multiplicative_average([1, 11])
show_multiplicative_average([100, 33, 57, 4, 13, 14, 17])
show_multiplicative_average([2, 5, 7, 11, 13, 17])

# multiply lists
def multiply_lists(arr1, arr2)
  arr1.map.with_index { |_el, i| arr1[i] * arr2[i] }
end

def zip(arr1, arr2)
  arr1.zip(arr2).map { |el| el.reduce(&:*) }
end

p multiply_lists([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
p zip([3, 5, 7], [9, 10, 11]) #== [27, 50, 77]

# multiply pairs
def multiply_all_pairs(arr1, arr2)
  final = []
  arr1.each do |n1|
    arr2.each do |n2|
      final << n1 * n2
    end
  end
  final.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) #== [2, 4, 4, 6, 8, 8, 12, 16]

final = [[1, 2, 3], [10, 20, 30]].map { |n1, _n2, n3| n1 * n3 }
p final

# end is near but not here
def penultimate(string)
  arr = string.split(' ')
  arr.pop
  arr[-1]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

def middle_word(string)
  return nil if string.empty?

  arr = string.split(' ')
  middle_index = (arr.length / 2).ceil
  arr[middle_index]
end

p middle_word('hey')
