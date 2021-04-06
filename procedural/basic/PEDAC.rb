# return palindromes
def palindromes(string)
  final = ''
  string.split.each { |word| final << word << ' ' if word == word.reverse && word.length > 1 }
  final
end

p palindromes('I saw a racecar on my radar')

def change_me(string)
  string.split.each { |word| word.upcase! if word == word.reverse && word.length > 1 }.join(' ')
end

string = 'I LOVE my mom and dad equally'

p change_me('I LOVE my mom and dad equally')
p string

def pal_substrings(_string)
  result = []
  substring_array = []
  substring_array.select { |el| el.length > 1 && el == el.reverse }
end

p pal_substrings('supercalifragilisticexpialidocious')

# def substrings(string)
#   start = 0
#   final = []
#   ending = string.length
#   loop do
#     loop do
#       final << string[start, ending]
#       start += 1
#       break if start == string.length - 1
#     end
#     final << string[start, ending]
#     ending -= 1
#     break if ending < 0
#   end
#   final
# end

def substrings(string)
  result = []
  start_index = 0
  end_index = start_index + 1
  loop do
    loop do
      result << string[start_index, end_index]
      end_index += 1
      break if end_index == string.size
    end
    start_index += 1
    end_index = start_index += 1
    break if start_index == string.size
  end
  result
end

p substrings('supercalifragilisticexpialidocious')
def pal(string)
  string == string.reverse
end

def pal_subs(string)
  array = substrings(string)
  array.select { |el| pal(el) }
end

p pal_subs('supercalifragilisticexpialidocious')
def substrings(str)
  result = []
  start_substring_idx = 0
  end_substring_idx = start_substring_idx + 1
  loop do
    break if start_substring_idx == str.size
    start_substring_idx += 1
  end
  p start_substring_idx  # 3
  p end_substring_idx    # 1
  result
end

p substrings('abc')
