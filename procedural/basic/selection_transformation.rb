alphabet = 'abcdefghijklmnopqrstuvwxyz'

i = 0
final = ''
loop do
  final << alphabet[i] if alphabet[i] == 'g'
  i += 1
  break if i == alphabet.length
end

p final

fruits = %w(apple banana pear)
i = 0

loop do
  fruits[i] << 's'
  i += 1
  break if i == fruits.length
end

p fruits

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(produce)
  i = 0
  final = {}
  arr = produce.keys

  loop do
    current_item = produce[arr[i]]
    final[arr[i]] = current_item if current_item == 'Fruit'
    i += 1
    break if i == arr.length
  end

  final
end

p select_fruit(produce)

my_numbers = [1, 4, 3, 7, 2, 6]
def double_numbs(array)
  i = 0
  loop do
    break if i == array.length
    array[i] *= 2
    i += 1
  end
  array
end

p double_numbs(my_numbers)
p my_numbers

def double_odds(numbers)
  i = 0
  doubled_odds = []

  loop do
    break if i == numbers.length
    numbers[i] *= 2 if numbers[i].odd?
    doubled_odds << numbers[i]
    i += 1
  end
  doubled_odds
end

p double_odds([1, 2, 3, 3, 5, 6, 8, 10])

def double_odd_positions(array)
  i = 0
  final = []

  loop do
    break if i == array.length
    current = array[i]
    current *= 2 if i.odd?
    final << current
    i += 1
  end
  final
end

p double_odd_positions([10, 10, 10, 10, 10])

def general_select(produce_list, selection_criteria)
  i = 0
  produce_keys = produce_list.keys
  final = {}

  loop do
    break if i == produce_keys.length
    current_key = produce_keys[i]
    current_value = produce_list[current_key]
    final[current_key] = current_value if current_value == selection_criteria
    i += 1
  end
  final
end

p general_select(produce, 'Vegetable')

def double_odd_positions(array, operand)
  i = 0
  final = []

  loop do
    break if i == array.length
    current = array[i]
    current *= operand
    final << current
    i += 1
  end
  final
end

p double_odd_positions([10, 10, 10, 10, 10], 10)

question = 'How many times does a particular character appear in this sentence?'

def select_letter(string, substring)
  final = ''
  i = 0
  loop do
    break if i == string.length
    final << string[i] if string[i] == substring
    i += 1
  end
  final
end

p select_letter(question, 'a') # => "aaaaaaaa"
