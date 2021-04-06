#Closures and variable scope

#A closure (a chunk of code between do..end or {}) binds to its surrounding artifacts (local variables, methods, object), builds an enclosure around them, and carries them with it when the closure is later called. This ensures that code within the enclosure will execute properly. Local variable scoping rules can be simplified to "local variables defined in outer scopes are available in inner scopes, but not vice versa." Closures are at the heart of local variable scoping rules--a nested block within a block is a part of the outer block's binding--any artifacts available in the outer block are part of the context/scope where the inner block is defined, and therefore bound to it/available within it. 

#example
5.times do 
  secret = "sh!"
  1.upto(2) do |time|
    puts "#Secret #{time}: #{secret} "
  end 
end 

windows = 5 
clean_windows = Proc.new {puts windows}
windows = 100 

clean_windows.call 

my_apartment = 'Woodrose'

5.times do |i|
  p my_apartment
  bell = 'ring ring'
  p bell 
  clean_windows.call 
  class Greet
    puts "AHHHH!"
  end
end 

#p bell 

#How does this example demonstrate closures and bindings? 

#What's happening: Local variable `bell` is passed to the `p` method, which calls `Kernel#puts` and passes in the return value of calling `inspect` on the object bound to the local variable. `bell` is initialized and assigned to a String object within the scope of the do..end block passed to the Integer#times method. This code demonstrates that closures (any chunk of code surrounded by {} or do..end) build an enclosure around all of the variables, methods, and other artifacts, bind to all of these artifacts, and carries them around to any point where the closure is later executed. 

#This specific example demonstrates that closures create enclosures around artifacts available in their scope and prevent access to these code artifacts from outside of the closure. 

5.times do |i|
 
  class Greet
    puts "AHHHH!"
  end
end 

p Greet.new 

#Why is Greet available outside of the block passed to the Integer#times method? What is being demonstrated? 

#What's happening: The `Greet` class is available outside of the block, at any point following the block. It is available because classes are constants, which have a lexical scope, which means that they are available based on where they appear in code rather than an abstract object model. 


#question 12 from the quiz 
def call_chunk(code_chunk)
  code_chunk.call
end

color = 'red'
say_color = Proc.new {puts "The color is #{color}"}
#color = "blue"
call_chunk(say_color)

#This problem challenges my mental model of a closure. Even though the lv `color` is defined on the same level as the closure `say_color`, it is not available. This means that-- lv color is actually not initialized within the scope of the `say_color` Proc object. This means that: Even if something is initialized on a peer scope, it is only available/part of the binding if it is initialized prior to the code that creates a new binding. This seems more like lexical scope to me rather than lv scope. 

1.times do 

  price = 50 #works when here but not after the inner Integer#times call


  1.times do 
    puts price 
  end 

end 

#What is part of the binding for the block body? 
ARRAY = [1, 2, 3]

def abc
  a = 3
end

def xyz(collection)
  collection.map { |x| yield x }
end

xyz(ARRAY) do
  # block body
end

#Karl's response to Felicia with a question like this. 

# I'd say it's perhaps less useful to think in terms of 'boundaries', and more useful to think in terms of scope. When we think about closures, and those closures binding to certain artifacts, we always want to think about scope. As you say in your third example:

# But this doesn't work because it's out of scope for the proc because it was initialized after the proc was created.

# This is exactly right. The local variable a in that example isn't in scope because it hasn't yet been initialized at the point where the closure is created. This is in contrast to the second example where a had already been initialized. The closure retains a access to the variable, so that even if it is re-assigned, the new value can be accessed.


#https://launchschool.com/posts/49fdb2e2
a_context = 1

# And we can instantiate a new Proc object that remembers that context
add_context = Proc.new { |y| y + a_context}

# Then we can use that object

five = add_context.(4)

a_context = 1

# And we can instantiate a new Proc object that remembers that context
add_context = Proc.new { |y| y + a_context}

# Then we can use that object
y = 4
five = add_context.(y)
# p five => 5

# We change the variable a_context
a_context = 2

mistery = add_context.(y + a_context) #6 + 2 

#  We can say a context to be something as simple as a variable holding an Integer
a_context = 1

# And we can instantiate a new Proc object that remembers that context
add_context = Proc.new { |y| y + a_context}

# Then we can use that object
y = 4
five = add_context.(y)
# p five => 5

# We change the variable a_context
a_context = 2

mistery = add_context.(y + a_context)
# What mistery will be assigned to?
# mistery => ???


#https://launchschool.com/posts/dc050bf1
#Understanding this completely requires a bit of knowledge about the stack and heap. I won't go into detail now, but the main thing to understand is that the stack is roughly equivalent to the current scope - it's basically a list of variables that each point to their values (which, in Ruby, are usually included on the heap).
#I think of a closure as an object that gets carried around by the code chunk (or vice versa - an object that carries around the code chunk). Specifically, I think of the closure object as basically being a reference to the stack for the current method (the method where you defined the closure). When the code in the closure runs, it temporarily changes its stack to the object that the closure object is carrying around. This lets the code run in what is essentially the same environment it was defined in. More to the point, since it's using a reference to that stack, it is using the current heap references, so it gets the current value rather than the original values for each variable.

#https://launchschool.com/posts/851e5128
#It's not quite clear to me where your confusion lies, but is it possible you're missing the fact that what we're doing here is trying to change your mental model of scope? Originally, we talked about inner and outer scopes, and showed that blocks, procs, and lambdas all have access to the outer scope, but the code in the outer scope does not have access to the inner scope. Now we're changing that mental model and using closures to explain how scope works. Blocks, procs, and lambdas all have access to the outer scope for one simple reason - they form closures, and can access names in the outer scope because those names are part of the binding.

#https://launchschool.com/posts/55f3151e
#The binding is everything that the block of code can access that is defined somewhere other than the block. In this case, the constant ARRAY and the two methods are both in scope when we define the block, so all 3 names are accessible to the block, and thus part of the binding.

#The binding is actually an object of type Binding. https://ruby-doc.org/core/Binding.html, but that's an implementation detail. In more general terms, it's just the everything the block of code can access without having to define it locally.



