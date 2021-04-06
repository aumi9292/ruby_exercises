# 1
ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 402, 'Eddie' => 10 }

p ages.member?('Herman')
p ages.include?('Herman')
p ages.key?('Herman')

# 2
munsters_description = 'The Munsters are creepy in a good way.'
p munsters_description.swapcase == 'tHE mUNSTERS ARE CREEPY IN A GOOD WAY.'
p munsters_description.capitalize == 'The munsters are creepy in a good way.'
p munsters_description.casecmp('the munsters are creepy in a good way.').zero?
p munsters_description.casecmp('THE MUNSTERS ARE CREEPY IN A GOOD WAY.').zero?

# 3
additional_ages = { 'Marilyn' => 22, 'Spot' => 237 }
p ages.merge(additional_ages)

# 4
advice = 'Few things in life are as important as house training your pet dinosaur.'
p advice =~ /dino/
p !!advice.match(/dino/)
p advice.include?('dino')
p advice.match?('dino')

# 5
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones2 = %w(Fred Barney Wilma Betty BamBam Pebbles)

# 6
flintstones2 << 'Dino'
p flintstones2

# 7
p flintstones2.concat(['Dino']).concat(['Hoppy'])
p flintstones2 << 'Dino' << 'Hoppy'
p flintstones2.concat(%w(Dino Hoppy))

# 8
advice = 'Few things in life are as important as house training your pet dinosaur.'
p advice.slice(-33..-1)
# new_advice = advice.slice!(39, (advice.length - 39))
p advice
# p new_advice

# 9
statement = 'The Flintstones Rock!'
p statement.count('t')

# 10
title = 'Flintstone Family Members'
p title.center(40)
