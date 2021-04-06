# frozen_string_literal: true

def accum(str)
  str.upcase.chars.map.with_index { |letter, index| letter + letter.downcase * index }.join(' - ')
end

p accum('abcd') == 'A - Bb - Ccc - Dddd'
p accum('RqaEzty') == 'R - Qq - Aaa - Eeee - Zzzzz - Tttttt - Yyyyyyy'
p accum('cwAt') == 'C - Ww - Aaa - Tttt'

# study session with Mandy--
# tips: read the problem aloud 1 or more times--go through each and every test case step by step to make sure you understand the input and outputs
# alg is non-linear--you can go backwards and change things
# use plain english for algorithm, no code

# problem: given a string, return a hash with counts as keys and arrays of unique values with those counts as values.
# rules: Characters in value arrays should be sorted alphabetically--ignore spaces, spcial chars, downcase everything

string = 'Mississippi'
p string.downcase.chars.sort.uniq.group_by { |el| string.downcase.chars.count(el) }

# alg
# downcase the string
# remove all chars that are not a-z0-9
# split the string into an array of chars
# create another arra of only the unique characters
# init a final hash object with a default value of []
# iterate over the unique chars
# for each unqiue char, push it into the value bound to the key representing the count of that char in the non-unique, downcased array of chars
# return the final hash

def get_char_count(string)
  string = string.downcase
  string.gsub!(/[^a-z0-9]/, '')
  chars = string.chars
  uniq_chars = chars.uniq
  final = Hash.new([])
  chars.count(chars[0])
  uniq_chars.each { |char| final[chars.count(char)] += [char] }
  final
end

p get_char_count('Mississippi')
