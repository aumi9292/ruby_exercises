def say(words = ["hello"])
  words.each {|word| puts word + "."}
end 

words = ["hey", "hi", "yo"]

say() 
say(words)
say

a=5

def some_method
  a = 3
end

puts a

def a_method(number)
  number = 7
end 

b = a_method(a)
puts a
puts b

a = [1, 2, 3]
p a 
def mutate(array)
  array.pop
end 
mutate(a)
p a

#return
def add_three(number)
  number + 3
end 

returned_value = add_three(4)
puts returned_value

puts add_three(5).next



def add(a, b)
  a+b
end
def subtract(a, b)
  a-b
end

puts add(20, 20)
puts add(add(5, 5), subtract(10, 5))

