# problem 1 take 1
def array_to_hash(array)
  final = {}
  array.each_with_index { |el, i| final[el] = i }
  final
end

flintstones = %w(Fred Barney Wilma Betty Pebbles BamBam)
p array_to_hash(flintstones)

# problem 2
ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 5843, 'Eddie' => 10, 'Marilyn' => 22, 'Spot' => 237 }
# take 1
p ages.values.sum
p ages.values.reduce(&:+)
sum = 0
p ages.each_value { |value| sum += value }
p sum

ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 402, 'Eddie' => 10 }
p ages.reject { |_k, v| v >= 100 }
p ages.map { |k, v| [k, v] unless v >= 100 }.compact.to_h

ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 5843, 'Eddie' => 10, 'Marilyn' => 22, 'Spot' => 237 }
p ages.sort.first
youngest = ages.first
ages.each { |pair| youngest = pair if pair[1] < youngest[1] }
p youngest

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.index { |el| el.downcase.start_with?('be') }

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.map { |el| el[0, 3] }

statement = 'The Flintstones Rock'
hash = Hash.new(0)
statement.chars.each { |el| hash[el] += 1 }
p hash

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
# outptut 1; 3

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
# output 1; 2, numbers = [1, 2]

def titleize(string)
  string.split.map(&:capitalize).join(' ')
end

words = 'the flintstones rock'
p titleize(words)

munsters = {
  'Herman' => { 'age' => 32, 'gender' => 'male' },
  'Lily' => { 'age' => 30, 'gender' => 'female' },
  'Grandpa' => { 'age' => 402, 'gender' => 'male' },
  'Eddie' => { 'age' => 10, 'gender' => 'male' },
  'Marilyn' => { 'age' => 23, 'gender' => 'female' }
}

final = munsters.each do |_person, stats|
  stats['age group'] = case stats['age']
                       when 0..18
                         'kid'
                       when 19..64
                         'adult'
                       else
                         'senior'
                       end
end

p final

numbers = [7, 3, 5, 2, 1, 8, 4]

numbers.each do |number|
  counter = 0
  number.times do
    counter += 1
    puts counter
  end
end

def snake(str)
  words = str.split
  current_word = 1

  loop do
    words[current_word].downcase!

    current_word += 1
    break if current_word >= words.size
  end

  words.join('_')
end

p snake('Hi there bob how are you')

def upper_snake(str)
  words = str.split
  current_word = 0

  loop do
    break if current_word == words.size

    words[current_word].upcase!
    current_word += 1
  end

  words.join('_')
end

p upper_snake('Hi there bob how are you')

ages = { 'Herman' => 32, 'Lily' => 31, 'Grandpa' => 402, 'Eddie' => 10 }

p ages.each { |_k, v| v += 10 }

arr = [1, 3, 5]
p arr.select(&:odd?)

p ages.select { |_k, v| v.even? }
p ages.map { |_k, v| v += 10 }

for name, age in ages
  puts "#{name} and #{age}"
end

hsh = { a: 'apple', b: 'pear', c: 'orange', d: 'kiwi', e: 'banana' }
counter = 0

new_hsh = {}

for letter, fruit in hsh
  new_hsh[letter] = fruit if fruit.size > 4
end

p new_hsh

def star_method(stars)
  final = for star in stars
            star.downcase
  end
  final
end

stars_1 = %w(Sirius Rigel Vega Polaris Altair)
stars_2 = star_method(stars_1)
p stars_1
p stars_2

p [1, 2, 3, 4, 5].select do |num|
  num + 1
end

['hi', 'bob'].map do |word|
  puts word
  word.upcase
end 

nums = %w(1 2 3 4)
i = 0 
loop do 
  puts num[i]
  nums.shift(1)
  i += 1
  break if i == nums.length
end 