# q1
numbers = [1, 2, 2, 3]
numbers2 = numbers.uniq
p numbers.object_id == numbers2

# q3
advice = 'Few things in life are as important as house training your pet dinosaur.'
advice[26..34] = 'urgent'
# alternatively: advice.gsub!('important', 'urgent')
p advice

# q4
nums = [1, 2, 3, 4, 5]
p nums.delete_at(1)
# removes element at index
nums2 = [1, 2, 3, 4, 5]
# removes all matching elements
p nums2.delete(1)

# q5
p (10..100).cover?(42)
p (10..100) === 42

# q6
famous_words = 'seven years ago...'
start = 'Four score and '
# p famous_words.prepend(start)
# p start << famous_words

# q7
flintstones = %w(Fred Wilma)
flintstones << %w(Barney Betty)
flintstones << %w(BamBam Pebbles)
# 1
# flat_fin = []
# p flintstones.join(' ').split.each { |el| flat_fin << el }
# p flat_fin
# 2
# p flintstones.flatten
# 3
p flintstones.join(' ').split

# 8
flintstones = { 'Fred' => 0, 'Wilma' => 1, 'Barney' => 2, 'Betty' => 3, 'BamBam' => 4, 'Pebbles' => 5 }
p flintstones.to_a.map { |el| el if el[0] == 'Barney' }.flatten.compact!
p flintstones
# barney = flintstones.select { |key, _value| key == 'Barney' }
# p barney

hash = { 1 => 'one', 2 => 'two' }
p hash.assoc(1)
