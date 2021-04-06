arr = [[1, 3], [2]]
p arr.object_id
p arr[0].object_id
# flattens the inner array and then adds all elements together, results in one integer
p arr.map { |el| el.reduce(&:+) if el.is_a?(Array) }.reduce(&:+)

arr[0][1] = 5
p arr.object_id
p arr[0].object_id

arr[0] = 5
p arr

animals = [{ a: 'ant' }, { b: 'bear' }]

animals[0][:c] = 'cat'

p animals

arr = [['a', ['b']], { b: 'bear', c: 'cat' }, 'cab']
p arr[0][1][0]
p arr[1][:c]
p arr[3]
p arr[1][:b][-1]

a = [1, 3]
b = [2]
ab = [a, b]
p ab

arr = [%w(1 100 50), %w(32 21 50), %w(14 2 1), %w(26 20 50)]

final = arr.sort.map do |inner|
  inner.sort_by(&:to_i)
end
p arr[0].sort_by(&:to_i)
p final

arr = [25, 45, 105, 1995, 123, 345_345, 23]

final = arr.sort_by do |num|
  num.to_s.chars.map(&:ord).reduce(&:+)
end

p arr[0].to_s.chars.map(&:ord).reduce(&:+)
p final

final = [[8, 13, 27, 15], %w(applessssss banana cantaloupe)].map do |arr|
  arr.select do |item|
    if item.to_s.to_i == item # if it's an integer
      item > 13
    else
      item.size < 6
    end
  end
end

p final

final = [[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.map do |element2|
    element2.partition do |element3|
      element3.size == 1
    end
  end
end

p final
