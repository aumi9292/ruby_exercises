alphabet = ('a'..'z').to_a.join
p alphabet
p alphabet[2, alphabet.length - 2]

def alpha_circulator(string)
  string.chars.each_with_index { |_letter, index| puts string[index, string.length - index] }
end

alpha_circulator(alphabet)

p str = 'The grass is green'
p str[4, 5]
p str[4..8]
p str.scan(/grass/)

alpharray = alphabet.split('')
p alpharray[2, 10][0, 3][2].is_a?(String)

p hsh = { 'fruit' => 'apple', 'vegetable' => 'carrot', 'fruit' => 'pear' }

# gotchas

p alphabet[30]
p alpharray[50]

arr = [3, 'd', nil]

p arr[2]
p arr[50]
p arr.fetch(1, 'uh oh')
p arr.fetch(50, 'uh oh')

str = 'ghijk'
arr = %w(g h i j k)

p str[-6]
p arr[-6]

str = "joe's favorite color is blue"
new_str = str.split.map(&:capitalize).join(' ')
p new_str

arr = [1, 2, 3, 4, 5]
arr[0] += 10
i = 0
while i < arr.length
  arr[i] += 10
  i += 1
end
p arr
new_arr = arr.map { |el| el**2 }
p new_arr

hsh = { apple: 'Produce', carrot: 'Produce', pear: 'Produce', broccoli: 'Produce' }
hsh[:carrot] = 'vegetable'
hsh[:pear] = 'fruit'
hsh[:broccoli] += 'veg'
p hsh
