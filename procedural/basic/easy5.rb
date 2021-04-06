# ASCII String Value
def ascii_value(string)
  string.chars.reduce(0) { |sum, current| sum + current.ord }
end

def ascii_2(string)
  sum = 0
  chars = string.split('')
  chars.each { |el| sum += el.ord }
  sum
end
p ascii_2('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_2('a') #== 97
p ascii_2('') == 0

# after midnight part 1
def time_of_day(mins)
  hours, minutes = mins.divmod(60)
  hours = (hours / 24).digits.last if hours >= 24
  hours = hours.divmod(24).last if hours <= -24

  return format('%02i', 24 + hours) + ':' + format('%02i', minutes) if mins.between?(-59, -1)
  format('%02i', hours) + ':' + format('%02i', minutes)
end

p time_of_day(-1437)

p time_of_day(0) #== '00:00'
p time_of_day(-3) == '23:57'
p time_of_day(35) == '00:35'
p time_of_day(-1437) == '00:03'
p time_of_day(3000) == '02:00'
p time_of_day(800) == '13:20'
p time_of_day(-4231) == '01:29'

def time_of_day(mins)
  mins_per_hours = 60
  hours_per_day = 24
  mins_per_day = 60 * 24

  delta_mins = mins % mins_per_day
  hours, minutes = delta_mins.divmod(mins_per_hours)
  format('%02d:%02d', hours, minutes)
end

p time_of_day(0) == '00:00'
p time_of_day(-3) == '23:57'
p time_of_day(35) == '00:35'
p time_of_day(-1437) == '00:03'
p time_of_day(3000) == '02:00'
p time_of_day(800) == '13:20'
p time_of_day(-4231) == '01:29'

# after midnight part 2
def midnight(time)
  hours, minutes = time.split(':').map!(&:to_i)
  mins_difference = (hours * 60) + minutes
  if mins_difference == 0 || mins_difference == (60 * 24)
    puts "This time is #{mins_difference} minutes after midnight or #{mins_difference} minutes before midnight too!"
  else
    puts "This time is #{mins_difference} minutes after midnight"
    puts "This time is #{(60 * 24) - mins_difference} minutes before midnight"
  end
  mins_difference
end

p midnight('00:00') #== 0
p midnight('00:00') #== 0
p midnight('12:34') #== 754
p midnight('12:34') #== 686
p midnight('24:00') #== 0
p midnight('24:00') #== 0

# letter swap
def swap(sentence)
  final = []
  reversed_copy_array = sentence.dup.split.map(&:reverse)
  sentence_array = sentence.split
  zipped = sentence_array.zip(reversed_copy_array)
  zipped.each do |word_set|
    word_set[0][0] = word_set[1][0]
    word_set[0][-1] = word_set[1][-1]
  end
  zipped.each { |word_set| final << word_set[0] }
  final.join(' ')
end

p swap('Oh what a wonderful day it is')
p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

def swap2(sentence)
  sentence.split.each { |word| word[0], word[-1] = word[-1], word[0] }.join(' ')
end

p swap2('Oh what a wonderful day it is')
p swap2('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap2('Abcde') == 'ebcdA'
p swap2('a') == 'a'

def swap_first_last_characters(a, b)
  a, b = b, a
end

word = 'hiya'

p swap_first_last_characters(word[0], word[-1])
p word

# clean up the words
def cleanup(string)
  i = 0
  final = ''
  while i < string.length
    final << (('a'..'z').cover?(string[i]) ? string[i] : ' ')
    i += 1
  end
  final.squeeze(' ')
end

def cleanup2(string)
  string.gsub(/[^a-z]+/, ' ')
end

p cleanup2("---what's my +*& line?") #== ' what s my line '

# letter counter
def word_hash(sentence)
  letters = Hash.new(0)
  sentence.split.each { |word| letters[word.length] += 1 }
  letters
end

# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# p word_sizes('') == {}

# letter counter part 2
def word_sizes(sentence)
  word_hash(sentence.split.map { |word| word.delete('^a-zA-Z') }.join(' '))
end

p word_sizes('Four score and seven.') #== { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!')

# alphabetical numbers
NUM_HASH = { 0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine', 10 => 'ten', 11 => 'eleven', 12 => 'twelve', 13 => 'thirteen', 14 => 'fouteen', 15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen' }.freeze

def alphabetic_number_sort(array)
  array.sort { |a, b| NUM_HASH[a] <=> NUM_HASH[b] }
end

p alphabetic_number_sort((0..19).to_a) #== [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]

# ddaaiilly double
def crunch(string)
  final = ''
  string.chars.each { |chr| final << chr unless final[-1] == chr }
  final
end

def regexcrunch(string)
  string.gsub(/(.)\1+/, '\1')
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p regexcrunch('ddaaiillyy ddoouubbllee') #== 'daily double'

p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

def print_in_box(string)
  string = ' ' + string + ' '
  puts '+' + ('-' * string.length) + '+'
  puts '|' + (' ' * string.length) + '|'
  puts '|' + string + '|'
  puts '|' + (' ' * string.length) + '|'
  puts '+' + ('-' * string.length) + '+'
end

print_in_box('hello world')
print_in_box('To boldly go where no one has gone before.')
print_in_box('')

def wrap_in_box(string)
  print_in_box if string.length < 78
  second_line = string[77..string.length]
  third_line = second_line[77..second_line.length]
  horizontal_bar = '+' + ('-' * 78) + '+'
  puts horizontal_bar
  puts "|#{' ' * 78}|"
  puts "| #{string[0..76]}|"
  if second_line.length < 76
    puts "| #{second_line} #{' ' * (76 - second_line.length)}|"
  else
    puts "| #{second_line[0..76]}|"
    puts "| #{third_line} #{' ' * (76 - third_line.length)}|"
  end
  puts horizontal_bar
end

wrap_in_box('To boldly go where no one has gone before. sdfkjhsdfkjhsdfkjhsdkjfhskjfhskjshfjkshdjfhsfsdkjfkjsddfjhsdfkjhsdkjfhskjdfhkjsdfhjksfsjkfsjkdfhsjkfhsjkfskjfsjkdsdjkfsjkfhjkf')
