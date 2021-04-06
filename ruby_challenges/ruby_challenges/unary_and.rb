# Unary & can be used in two contexts.
 #1. First, it can be prepended to an parameter name in a method's implementation/definition. In this context, it tells Ruby to expect a block as an argument. This is an explicit way to take a block. It will convert a block to a Proc object that can be executed in the method definition. If the method is given an argument that is not a block, an ArgumentError will be raised. The block can be executed within the method by Proc#call or Object#yield. 

 def study(&material)
  puts "I'm studying!"
  yield if block_given? 
 end 

 my_proc = Proc.new {puts "this is a proc!"}

 #study(my_proc) #argument error, & in a parameter only takes a block

 #study('hello') #same, ArgumentError

 study { puts "All night long!"}

def demonstrate_yield_and_call(&block)
  yield   
  block.call 
end  

demonstrate_yield_and_call {puts "this works either way"}

demonstrate_yield_and_call(&my_proc)

  #2. Unary & can also be prepended to an argument that's being passed into a method invokation. In this context, unary & expects a Proc object. It attempts to convert the Proc object to a block. If it is not a Proc object, Symbol#to_proc is called on it. If there is a method whose name matches the symbol, that method will be converted to a block and passed into the method.

  #Below, local variable `arr` is initialized and assigned to an Array object. The Array#map method is called and passed Symbol object :to_s prepended with the unary `&` operator. In this context, the unary `&` operator expects either a Proc or a Symbol object. :to_s is a symbol, so Symbol#to_proc is called, and each the method with the same name as the symbol (Integer#to_s) is called on each element within the Array object bound to the `arr` local variable. 
  arr = [1, 2, 3]

  p arr.map(&:to_s)


  #What's happening below? 
  #Object#take_a_method is invoked on line x, with unary & operator prefixed to :a_method. Symbol_to_proc is called on the symbol, which converts the method with the same name as the Symbol object to a Proc object. The proc object `a_method` is then passed into the Object#take_a_method call. Object#yield is then passed the constant Object. Because Object#a_method is a public class method on the Object class, #a_method can successfully be called on Object. The Object#yield method is called and passed in the constant Object. 

public 
  def a_method
    puts "123 easy as abc"
  end 

  def take_a_method(&block)
    yield(Object) 
    p block.class
  end 

  take_a_method(&:a_method)

  #Proc#call can take arguments, just as Object#yield can be passed arguments. If the Proc object is defined with a block parameter, the block local variable will be assigned the passed in argument. 

  my_proc = Proc.new { |saying| puts saying.upcase }
  
  def shout_the_proc(*procs)
    procs.first.call("hi there")
    p procs
  end 

  shout_the_proc(my_proc, my_proc.call('goodbye'))

  #The *procs is a misnomer. It is only being sent one proc, and then the return value of another proc. This code executes #call on the object bound to my_proc, passing in 'goodbye'. This is executed before any of the code in the method implementation. Then the return value of that proc, nil, is assigned to the second element in the * splat array. 

  my_proc = Proc.new do 
    puts "hello"
    return 
    puts "goodbye" 
  end 
  
  def a_method(proc1) 
    proc1.call 
    puts "hello again from this method"
  end 
    
  a_method(my_proc)

  ret_val = 1.times do |ele|
            puts 1
            puts 2
            return 10
            puts '6'
end   

p ret_val 