arr = [1, 2, 3, 4, 5]
counter = 0
loop do
  arr[counter] += 1
  counter += 1
  break if counter == arr.length
end
p arr

loop do
  num = rand(1..10)
  puts 'hello'
  if num == 5
    puts 'exiting'
    break
  end
end

i = 0
loop do
  i += 1
  next if i.odd?
  puts i
  break if i == 10
end

alphabet = ('a'..'z').to_a.join
p alphabet
i = 0
loop do
  puts alphabet[i]
  i += 1
  break if i == alphabet.length
end

colors = %w(green blue purple orange)
counter = 0
loop do
  break if counter == colors.length
  puts "My favorite color is #{colors[counter]}"
  counter += 1
end

i = 0
objects = ['hello', :key, 10, []]
loop do
  break if i == objects.length
  puts objects[i].class
  i += 1
end

number_of_pets = {
  'dogs' => 2,
  'cats' => 4,
  'fish' => 1
}
pets = number_of_pets.keys

counter = 0
loop do
  break if counter == number_of_pets.length
  current_pet = pets[counter]
  current_pet_number = number_of_pets[current_pet]
  puts "#{current_pet} and  #{current_pet_number}"
  counter += 1
end

person = { name: 'Austin', age: 28, eye_color: 'hazel', smart: true }

person_traits = person.keys

i = 0

loop do
  current_trait = person_traits[i]
  puts person[current_trait].class
  i += 1
  break if i == person_traits.length
end
