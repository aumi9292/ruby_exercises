class Device
  attr_reader :recordings

  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    record(yield) if block_given?
  end

  def play
    puts recordings[-1]
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"

class TextAnalyzer
  def process
    file = File.open('sample.txt')
    yield(file)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| puts "#{File.readlines(file).join.split("\.\n\n").length} paragraphs" }

analyzer.process do |file|
  lines = 0
  file.each { lines += 1 }
  puts "#{lines} lines"
end

analyzer.process do |file|
  file = file.read
  puts "#{file.split(' ').length} words"
end

# passing parameters
items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  intro = "Let's start gathering food."
  things = (items.join(', ')).to_s
  outro = "Nice selection of food we have gathered!"
  yield(intro, things, outro)
end

gather(items) { |int, things, out| puts int, things, out }

def bird_method(arr)
  yield(arr)
end
birds = %w(raven finch hawk eagle)
bird_method(birds) { |_a, _b, c, d| puts c, d }

# passing params pt 3
items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |a, *b|
  puts a + ', ' + b[0, 2].join(', ')
  puts(b.last)
end

gather(items) do |a, b, *c|
  puts a
  puts b + ', ' + c[0]
  puts c[1, 2].join(' ')
end

gather(items) do |a, *b|
  puts a
  puts b.join(', ')
end

gather(items) do |a, b, c, d|
  puts a + ', ' + b + ', ' + c + ', and ' + d
end

def convert_to_base_8(n)
  n.to_s(8).to_i # replace these two method calls
end

# The correct type of argument must be used below
base8_proc = method(:convert_to_base_8).to_proc

# We'll need a Proc object to make this code work. Replace `a_proc`
# with the correct object
p [8, 10, 12, 14, 16, 33].map(&base8_proc)

# bubble sort
def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      if block_given?
        next if yield(array[(index - 1)..index])
      else
        next if array[index - 1] <= array[index]
      end
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
  nil
end
a = [1, 2, 3, 4, 5, 4, 3, 2, 1]
bubble_sort!(a) # { |array, index| array[index - 1] <= array[index] }
p a

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
p array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)

def convert_to_base_8(n)
  n.to_s(8).to_i
end

p :convert_to_base_8

base8_proc = method(:convert_to_base_8).to_proc

base_8_method = method(:convert_to_base_8)
p base_8_method
p base_8_method.class

p [8, 10, 12, 14, 16, 33].map(&base8_proc)

p [8, 10, 12, 14, 16, 33].map(&base_8_method)

p [8, 10, 12, 14, 16, 33].map { |n| convert_to_base_8(n) }

# I'm working through Ruby 130 small problems and I have a few questions about Medium 1 Exercise 6. I explain what I think is happening below and note my 3 questions below that. If anyone has time or feels like doing some explaining, I'd love to hear what you have to say. Otherwise--no worries at all--this was a lot to write and go through and I feel like just doing that helped me get a slightly better understanding.

# This code seems like a big deal. It's really cool that we can effectively execute a block of code that takes a parameter and still use the  `.method_call(&block_name)` syntax rather than ``.method_call {|n| other_method(n) }`.

# What I think is happening:

# Array#map is called on an array object. The #map method call is passed an argument in the form of &based8_proc (*Q1). Because local variable base8proc is bound to a Proc object, `&` converts it to a block (no longer an object, but a method). In other words, the final line of code could be written as: `p [8, 10, 12, 14, 16, 33].map { |n| convert_to_base_8(n) }`.

# Then, this conversion correctly handles block local variable initialization and can correctly assign each element of the calling Array object to the block local variable and passes it in as the argument to the `convert_to_base8(n)` method call, which has been converted from a Proc object. (*Q2)

# Q1: What is &based8_proc here? How do you refer to it? I think of it as an argument, a Proc object prefixed with &, a local variable 'base8_proc' prefixed with &. The third option seems the most accurate to me. Is there a more accurate way to talk about this snippet?

# Q2: Is this what others understand to be happening? Would anyone describe anything differently?

# Q3: On the topic of the `Object#method` method, I was under the impression that methods, like blocks, are one of the few items that are not objects. It would appear a correction to my mental model is underway. I can call lines `` which returns a String representation of the method and the class name `Method`. Are methods that are defined, but not saved in a local variable using this Object#method method, not objects? In other words, for a method to be an object, do we have to call the Object#method method and pass it the method name? This seems to make sense to me, because doing `p some_method_name` would simply call p on the return value of `some_method_name`, rather than printing a String representation of a Method object.
