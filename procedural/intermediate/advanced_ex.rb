
# Group 1

#missed: #proc objects can be created without the call to ::new 

my_proc = proc { |thing| puts "This is a #{thing}." } # **

puts my_proc # String#to_s called on obj bound to my_proc is output 

  # => <Proc10101traceback>

puts my_proc.class # return value of Object#class called on obj bound to my_proc passed to Kernel#puts method call

  #Proc is output to stdout 

my_proc.call # Proc call called on obj bound to my_proc--proc is executed

  # => "This is a "

my_proc.call('cat') #String object passed to Proc#call, on obj bound to my_proc--block param 'thing' now points to string obj 'cat'

  # => "This is a cat" is output to stdout 

# Group 2
#What two main concepts does this code demonstrate? 

#This code demonstrates multiple alternative syntaxes available to create Procs, and that lambdas enforce a stricter arity with arguments between the number of parameters defined in a block and the number of arguments passed into it. 

##missed: A lambda is of the Proc class
##missed: the ::new method cannot be called on Lambda--lambdas are Proc objects 

my_lambda = lambda { |thing| puts "This is a #{thing}." } #demos lambda construction syntax synonymous to Proc construction syntax
my_second_lambda = -> (thing) { puts "This is a #{thing}." } #demos alternative lambda syntax with -> (block_param) { code_to_execute }
puts my_lambda #calls Lambda#to_s <lambda303030 traceback> ***
puts my_second_lambda #same as line above, diff obj
puts my_lambda.class #outputs Lambda 
my_lambda.call('dog') #outputs "This is a dog" to stdout
#my_lambda.call #outputs ArgumentError to stderr
#my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." } #third lambda syntax, class method ::new can be called on lambda and passed a block as an argument ****

# Group 3
#This code demonstrates that blocks have a lenient arity--if you define a block to take a parameter, and do not pass one in via the yield method call, the parameter will be pointed to the nil object. It also demonstrates that a method with a call to yield within it will raise a LocalJumpError if it is not passed a block unless yield is wrapped in a conditional with Kernel#block_given? 

def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."} # => "This is a "
#block_method_1('seal') # => LocalJumpError output to stderr

# Group 4
#This code demonstrates that Object#yield can be passed an argument, which will point the block parameter to the passed in object. If there are more block parameters than arguments passed into the yield method, they will be bound to nil. If a local variable is not in scope and there is no block parameter with the name that's being referenced, an undefined local variable or method error will be raised. 

def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."} 
  # => outputs "This is a turtle" to stdout

block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
  #outputs "This is a turtle and a "

#block_method_2('turtle') { puts "This is a #{animal}."}
  #raises NameError undefined local variable or method animal 

  #assert_equal uses {X} to compare the first and second arguments

  def a_method(&block)
  end 

  p a_method