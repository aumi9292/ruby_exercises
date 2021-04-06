# practice 1

arr = %w(10 11 9 7 8)

final = arr.sort_by(&:to_i).reverse
final2 = arr.sort { |a, b| b.to_i <=> a.to_i }

p final
p final2

# practice 2
books = [
  { title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967' },
  { title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925' },
  { title: 'War and Peace', author: 'Leo Tolstoy', published: '1869' },
  { title: 'Ulysses', author: 'James Joyce', published: '1922' }
]

p books.sort_by { |k, _v| k[:published] }

# practice problem 3
arr1 = ['a', 'b', ['c', %w(d e f g)]]
p arr1[2][1][3]

arr2 = [{ first: %w(a b c), second: %w(d e f) }, { third: %w(g h i) }]
p arr2[1][:third][0]

arr3 = [['abc'], ['def'], { third: ['ghi'] }]
p arr3[2][:third][0][0]

hsh1 = { 'a' => %w(d e), 'b' => %w(f g), 'c' => %w(h i) }
p hsh1['b'][1]

hsh2 = { first: { 'd' => 3 }, second: { 'e' => 2, 'f' => 1 }, third: { 'g' => 0 } }
p hsh2[:third].keys[0]

# practice problem 4 change all 3 to 4
arr1 = [1, [2, 3], 4]
arr1[1][1] += 1
p arr1

arr2 = [{ a: 1 }, { b: 2, c: [7, 6, 5], d: 4 }, 3]
arr2[2] += 1
p arr2

hsh1 = { first: [1, 2, [3]] }
hsh1[:first][2][0] += 1
p hsh1

hsh2 = { ['a'] => { a: ['1', :two, 3], b: 4 }, 'b' => 5 }
hsh2[['a']][:a][2] += 1
p hsh2

# practice 5 return total age of all males
munsters = {
  'Herman' => { 'age' => 32, 'gender' => 'male' },
  'Lily' => { 'age' => 30, 'gender' => 'female' },
  'Grandpa' => { 'age' => 402, 'gender' => 'male' },
  'Eddie' => { 'age' => 10, 'gender' => 'male' },
  'Marilyn' => { 'age' => 23, 'gender' => 'female' }
}

p munsters['Herman']['age']

final = munsters.select { |person| munsters[person].key('male') }.map { |el| el[1]['age'] }.reduce(&:+)

p final
# p final.map { |el| el[1]['age'] }.reduce(&:+)

ages = 0

munsters.each_value do |stat|
  ages += stat['age'] if stat['gender'] == 'male'
end
p ages

# final = munsters.each_value.reduce(0) do |sum, value|
#   sum + value['age'] if value['gender'] == 'male'
# end

# p final

munsters.each do |key, value|
  puts "#{key} is a #{value['age']} year-old #{value['gender']}"
end

vowels = []
hsh = { first: %w(the quick), second: %w(brown fox), third: ['jumped'], fourth: %w(over the lazy dog) }
hsh.each_value do |arr|
  arr.each do |hsh_words|
    hsh_words.each_char do |letter|
      vowels << letter if /[aeiou]/ =~ letter.downcase
    end
  end
end

p vowels.join.length

arr = [%w(b c a), [2, 1, 3], %w(blue black green)]

p arr.map { |inner| inner.sort { |a, b| b <=> a } }

aoh = [{ a: 1 }, { b: 2, c: 3 }, { d: 4, e: 5, f: 6 }]

# naoh = aoh.map do |hsh|
#   hsh.map { |arr| { arr[0].to_sym => arr[1] + 1 } }
# end

# p naoh

nested = aoh.map do |hsh|
  hsh.transform_values do |v|
    v + 1
  end
end

p nested

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

# selected = arr.select do |inner|
#   inner.map { |num| num if num % 3 == 0 }
# end

# p selected

final = arr.map do |inner|
  inner.select { |num| num if num % 3 == 0 }
end

p final

# 12
arr = [[:a, 1], %w(b two), ['sea', { c: 3 }], [{ a: 1, b: 2, c: 3, d: 4 }, 'D']]

final = arr.map do |inner|
  { inner[0] => inner[1] }
end

p final

# 13
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
final = arr.sort_by do |inner|
  inner.map { |num| num if num.odd? }
end

p final

# 14
hsh = {
  'grape' => { type: 'fruit', colors: %w(red green), size: 'small' },
  'carrot' => { type: 'vegetable', colors: ['orange'], size: 'medium' },
  'apple' => { type: 'fruit', colors: %w(red green), size: 'medium' },
  'apricot' => { type: 'fruit', colors: ['orange'], size: 'medium' },
  'marrow' => { type: 'vegetable', colors: ['green'], size: 'large' }
}

final = []
hsh.each_value do |inner_hash|
  final << if inner_hash[:type] == 'fruit'
             inner_hash[:colors].map(&:capitalize)
           else
             inner_hash[:size].upcase
           end
end

p final

# 15
arr = [{ a: [1, 2, 3] }, { b: [2, 4, 6], c: [3, 6], d: [4] }, { e: [8], f: [6, 10] }]

final = arr.select do |level1|
  level1.values.flatten.all?(&:even?)
end

p final

HEX = %w(0 1 2 3 4 5 6 7 8 9 A B C D E F).freeze

def uuid
  final = ''
  32.times do |i|
    final << HEX[rand(0..15)]
    final << '-' if i == 8 || i == 12 || i == 16
  end
  final
end

p uuid
