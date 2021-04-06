names = ['bo', 'jo', nil, 'kelly']

names.each do |name|
  begin 
    puts "#{name} is #{name.length} characters long!"
  rescue 
    puts "This is not the person you're looking for"
  end 
end 

def greet(person)
  puts "Hello" + person
end 

greet("john")

def lab_check(word)
  (word =~ /lab/).is_a?(Integer)
end 

puts lab_check("laboratory")
puts lab_check("experiment")
puts lab_check("Pans Labrynth")
puts lab_check("elaborate")
puts lab_check("polar bear")

def execute(&block)
  block.call
end 
execute {puts "hey from block!"}
