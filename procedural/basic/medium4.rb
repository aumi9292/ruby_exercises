# 1
phrase = 'The Flintstones Rock!'
10.times { |i| puts ' ' * i + phrase }

# 2
# error puts 'the value of 40 + 2 is ' + (40 + 2)
# fix1
puts 'the value of 40 + 2 is ' + (40 + 2).to_s
puts 'the value of 40 + 2 is %s' % (40 + 2)

def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end
p factors(10)

# 7
munsters = {
  'Herman' => { 'age' => 32, 'gender' => 'male' },
  'Lily' => { 'age' => 30, 'gender' => 'female' },
  'Grandpa' => { 'age' => 402, 'gender' => 'male' },
  'Eddie' => { 'age' => 10, 'gender' => 'male' },
  'Marilyn' => { 'age' => 23, 'gender' => 'female' }
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member['age'] += 42
    family_member['gender'] = 'other'
  end
end

mess_with_demographics(munsters)
p munsters
