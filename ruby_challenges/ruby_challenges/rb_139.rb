a = 1
b = 2

my_proc = Proc.new { p local_variables }

c = 3

my_proc.call # => [:my_proc, :b, :a, .....] # ignore everything after a

p local_variables # => [:c, :my_proc, :b, :a, .....] # ignore everything after a

my_proc = Proc.new { puts a }

a = 'hello'

my_proc.call
#undefined local variable or method `a' for main:Object (NameError)

my_proc = Proc.new { puts a }

def a
  'hello'
end

my_proc.call
# => 'hello'

a = 1
b = 2
my_proc = Proc.new do
  p a
  p b
end
my_proc.call
c = 3

# this works, and outputs the values of a and b

my_proc = Proc.new do
  p c
end
my_proc.call
c = 3 # => undefined local variable or method `c' for main:Object (NameError)

# this doesn't work, because c was not in scope (and so not part of the proc's binding), 
# when the proc was created

my_proc = Proc.new do
  p c
end

c = 3 # => undefined local variable or method `c' for main:Object (NameError)
my_proc.call

# this doesn't work, for the same reasons as example 2
# even though we call the proc after c is defined it wasn't in scope when the 
# proc was created and so is still not part of the binding

#lesson 1 block review
#In Ruby, every method can take an optional block as an implicit parameter.


def compare(str)
  puts "Before: #{str}"
  puts "After: #{yield(str)}"
end 

p compare('hi') { |word| word.upcase }

# Output:
# Before: hi
# After: HI

#purposes of closures: 
#Defer some implementation code to method invocation decision. The method implementor is saying "hey, I don't know what the specifics of your scenario are, so just pass them in when you need to call this method. I'll set it up so that you can refine it later, since you understand your scenario better."


#Methods that need to perform some "before" and "after" actions - sandwich code.

#Sandwich code is a good example of the previous point about deferring implementation to method invocation. There will be times when you want to write a generic method that performs some "before" and "after" action. Before and after what? That's exactly the point -- the method implementor doesn't care: before and after anything. 
#Timing, logging, notification systems are all examples where before/after actions are important.

#Another area where before/after actions are important is in resource management, or interfacing with the operating system. Many OS interfaces require you, the developer, to first allocate a portion of a resource, then perform some clean-up to free up that resource. Forgetting to do the clean-up can result in dramatic bugs -- system crashes, memory leaks, file system corruption.

#implict blocks 
#Every method, regardless of its definition, takes an implicit block. It may ignore the implicit block, but it still accepts it. However, there are times when you want a method to take an explicit block; you do that by defining a parameter prefixed by an & character in the method definition