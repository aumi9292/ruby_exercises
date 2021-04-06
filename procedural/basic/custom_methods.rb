def cust_compact(array)
  final = []
  array.select {|el| final << el unless !el}
  final 
end 

array = [1, 3, nil, 5]

puts cust_compact(array)

arr2 = [1, 2, 3, 4, 5, 6, 7, 8, 8, 9, 10]

reduced = arr2.reduce(0) {|previous, current| previous + current}
puts reduced

# cust_red = arr2.each_with_index do |el, i| 
#   total = 0 
#   i > 0  ? total += arr2[i-1] + el : total += el
#   puts total
# end 


def cust_red(array)
  total = 0 
  array.each_with_index do |el, i|
    total += el 
  end 
  total
end 

puts cust_red(arr2)

puts ""


def cust_flatten(array)
  level1 ||= []
  array.each do |el| 
    el.is_a?(Array) ? cust_flatten(el) : level1 << el
    p level1
  end 
  level1
end 

p cust_flatten([1, 2, 3, [4, 5, 4, 5, 6], 7, 8])

def cust_zip(array1, array2)
  final = []
  array1.each_with_index do |el, i|
    inner = Array.new
    inner << el << array2[i]
    final << inner
  end 
  final 
end 

p cust_zip([1, 2, 3], ["a", "b"])

zipped = [1, 2, 3, 4].zip(["a", "b", "c"], [10, 20, 30])

my_hash = {name: "Austin", job: false, age: 28, city: "Denver"}

def custom_store(hash, key, value)
  hash[key] = value
  hash
end 

puts custom_store(my_hash, :tired, true)

def custom_keys(hash)
  keys = []
  hash.each {|pair| keys << pair[0]}
  keys
end

p custom_keys(my_hash)

def custom_values(hash)
  values = []
  hash.each {|k, v| values << v}
  values
end 

p custom_values(my_hash)

my_hash.each_key {|one| p one}

