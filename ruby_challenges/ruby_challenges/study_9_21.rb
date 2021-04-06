def test2(block)
  puts "hello"
  block.call                    
  puts "good-bye"
end

def test(&block)
  puts "1"
  test2(block)
  puts "2"
end

test { puts "xyz" }
# => 1
# => hello
# => xyz
# => good-bye
# => 2

#how Ruby implements closures is at the core of how variable scope works, and therefore, it's at the core of how Ruby itself works.
#A closure must keep track of its surrounding context in order to have all the information it needs in order to be executed later. This not only includes local variables, but also method references, constants and other artifacts in your code -- whatever it needs to execute correctly, it will drag all of it around. 
def call_me(some_code)
  some_code.call            # call will execute the "chunk of code" that gets passed in
end

name = "Robert"
chunk_of_code = Proc.new {puts "hi #{name}"}

call_me(chunk_of_code)

def call_me(some_code)
  some_code.call
end

name = "Robert"
chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin III"        # re-assign name after Proc initialization

call_me(chunk_of_code)


# Symbol#to_proc, &param versus &arg
def my_method
  yield(2)
end

def another(&method)
  method.call(2) 
end 

# turns the symbol into a Proc, then & turns the Proc into a block
my_method(&:to_s)               # => "2"
p another(&:to_s)

def custom_times(int)
  counter = 0 
  loop do 
    yield(counter) if block_given? 
    counter += 1 
    break if counter == int
  end 
  int 
end

custom_times(5) {|n| puts n }

def custom_each(coll)
  i = 0 
  loop do 
    yield(coll[i])
    i += 1 
    break if i == coll.length
  end
  coll
end 

p custom_each([1, 2, 3, 4]) {|el| puts el * 10 }

def custom_select(coll)
  final = []
  coll.each {|el| final << el if yield(el)}
  final 
end
array = [1, 2, 3, 4, 5]

p custom_select([1, 2, 3, 4, 5, 6, 7, 8, 9,]) {|el| el.odd? }
p custom_select(array) { |num| num.odd? }      # => [1, 3, 5]
p custom_select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p custom_select(array) { |num| num + 1 }  

def custom_reduce(coll, starting = coll[0]) 
  final = starting 
  if starting != coll[0] 
    coll[0..-1].each { |el| final = yield(final, el)}
  else 
    coll[1..-1].each { |el| final = yield(final, el)}
  end 
  final 
end 

p custom_reduce(array) {|acc, el| acc + el }

