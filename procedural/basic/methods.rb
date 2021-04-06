arr = [1, 2, 3]

arr.each { |num| num * 2 }

hash = { a: 1, b: 2, c: 3 }

hash.each { |k, v| puts "#{k}: #{v}" }

def a_method(arr)
  arr.each do |num|
    puts num * 2
  end
end

p a_method(arr)
p arr

p arr.select(&:odd?)

p hash.map { |_k, v| v * 10 }

# #more methods

p arr.any? { |num| num > 2 }

animal_hash = { s: 'ant', b: 'bear', c: 'cat' }

p animal_hash.any? do |_key, value|
  value.size > 5
end

puts({ a: 'ant', b: 'bear', c: 'cat' }.any? { |_key, value| value.size > 4 })

p arr.first(2)
