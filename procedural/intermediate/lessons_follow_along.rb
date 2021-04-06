require 'pry'

def echo_with_yield(str)
  yield if block_given?
  str
end

echo_with_yield("hello!") { puts "world" }
puts
p echo_with_yield("hello!")
# If puts is used within the block and yield is the final line in the method, nil is the return value of the method

def say(words)
  yield if block_given?
  puts "> " + words
end

say("hi there") { system 'clear' }

def increment(num)
  yield(num + 1, 10) if block_given?
  num + 1
end

p increment(5) { |num| puts num }

def test
  yield(1) # passing 1 block argument at block invocation time
end

# method invocation
test do |num1, num2| # expecting 2 parameters in block implementation
  puts "#{num1} #{num2}"
end

def compare(arg)
  before = arg.clone
  after = yield(arg) if block_given?
  puts "Before: #{before} After: #{after}"
end

compare(10) { |n| n * 10 }

def time_it
  time_before = Time.now
  yield if block_given?
  time_after = Time.now

  puts "It took #{time_after - time_before} seconds."
end

time_it { |_thing| thing = "thensdosdhgkjdshg;ghfhgdjfgkjdfg dfgkjdhfg dfg df df sdfsdf sdf sdfs dfsdf sdfsd fsdf sdf sdfs dfsd fsdf sdf sdf sfsdfsdf sdfs df sdfsd fs dfsdf sdf sdfsdfsdfsdfsfsfsdfsdffsdfsdfsdfsdfdfsfsfdsfsdfsdfsdfsdfsfsdfsdf sfsdfs dfsdf sdf sdf sdfsfdsdfsdfsdfsdfsdfsdfsdfsdfsdf sdfsdf  dsf sdfoihjth oeoht [oerht we[i ioh gno[ij ergij erouhw erweir wpeithje [rpghebihsdfhg4pthpq384ht[qwirh fgs ghdshb p rethaw [f9h s[f0b9j sd[0fb9jq[-340jg [hq92h[09ej fg9je9srgh[".chars.permutation }

5.times do |num|
  puts num
end
# implement a times method
# from 0 up to the integer - 1, pass each integer to the block. Then return the calling number

def custom_times(n)
  x = 0
  while x < n
    yield(x) if block_given?
    x += 1
  end
  n
end

p custom_times(5) { |n| puts n }

def custom_each(collection)
  x = 0
  until x == collection.length
    yield(collection[x])
    x += 1
  end
  collection
end

p custom_each([1, 2, 3, 4]) { |el| puts el * 10 }

def custom_select(collection)
  final = []
  counter = 0
  while counter < collection.length
    final << collection[counter] if yield(collection[counter])
    counter += 1
  end
  final
end

array = [1, 2, 3, 4, 5]

array = [1, 2, 3, 4, 5]

p custom_select(array, &:odd?) # => [1, 3, 5]
p custom_select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p custom_select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true

def custom_reduce(collection, final = collection[0])
  counter = final == collection[0] ? 1 : 0
  while counter < collection.length
    final = yield(final, collection[counter])
    counter += 1
  end
  final
end

p custom_reduce([1, 2, 3, 4, 5], 1) { |acc, el| acc * el }

# [5, 10, 15], 0 -- 30
# ['i', 'l', 'k'], '' -- 'ilk'
array = [1, 2, 3, 4, 5]

p custom_reduce(array) { |acc, num| acc + num }                    # => 15
p custom_reduce(array, 10) { |acc, num| acc + num }                # => 25
# p custom_reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
p custom_reduce(['a', 'b', 'c']) { |acc, value| acc + value } # => 'abc'
p custom_reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

puts todo1
puts todo2
puts todo3
todo1.done!
puts todo1

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def each
    @todos.each { |todo| yield todo }
  end

  def add(item)
    raise TypeError, "Can only add Todo objects" unless item.instance_of?(Todo)
    todos << item
    todos
  end

  alias << add
  # def <<(item)
  #   add(item)
  # end

  def size
    todos.length
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos
  end

  def done?
    todos.all?(&:done?)
  end

  def item_at(index)
    todos.fetch(index)
  end

  def mark_done_at(index)
    to_mark = todos.fetch(index)
    to_mark.done!
  end

  def mark_undone_at(index)
    to_mark = todos.fetch(index)
    to_mark.undone!
  end

  def done!
    todos.each(&:done!)
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(index)
    todos.fetch(index)
    todos.slice!(index, 1)
  end

  def to_s
    puts "---#{title}---"
    todos.each { |item| puts item }
  end

  # rest of class needs implementation
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
p list.add(todo1)                 # adds todo1 to end of list, returns list
p list.add(todo2)                 # adds todo2 to end of list, returns list
p list.add(todo3)                 # adds todo3 to end of list, returns list
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# <<
# same behavior as add

# ---- Interrogating the list -----

# size
p list.size # returns 3

# first
p list.first # returns todo1, which is the first item in the list

# last
p list.last # returns todo3, which is the last item in the list

# to_a
p list.to_a # returns an array of all items in the list

# done?
p list.done? # returns true if all todos in the list are done, otherwise false

# ---- Retrieving an item in the list ----

# item_at
# list.item_at                    # raises ArgumentError
p list.item_at(1) # returns 2nd item in list (zero based index)
# p list.item_at(100)               # raises IndexError

# ---- Marking items in the list -----

# mark_done_at
# list.mark_done_at               # raises ArgumentError
p list.mark_done_at(1) # marks the 2nd item as done
# list.mark_done_at(100) # raises IndexError

# mark_undone_at
# list.mark_undone_at             # raises ArgumentError
p list.mark_undone_at(1) # marks the 2nd item as not done,
# list.mark_undone_at(100) # raises IndexError

# done!
p list.done! # marks all items as done

# ---- Deleting from the list -----

# shift #start here
# p list.shift # removes and returns the first item in list

# pop
# p list.pop # removes and returns the last item in list

# remove_at
# list.remove_at                  # raises ArgumentError
p list.remove_at(1) # removes and returns the 2nd item
# list.remove_at(100) # raises IndexError

# ---- Outputting the list -----

# to_s
list.to_s # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym

name = "Robert"
chunk_of_code = Proc.new { puts "hi #{name}" }
name = "grifif"
def some_method(code)
  code.call
end

some_method(chunk_of_code)

def meth(&proc)
  proc.call
end

meth { puts "hello" }

def welcome(str)
  block_given? ? str + ' ' + yield : str
end

p welcome('hello')
p welcome('hello') { "bob" }

def hello
  a = 10, b = 20, c = 30
  yield(a, b, c)
end

hello { |_a, b| p b }

def bob
  yield if block_given?
end

bob

def call_chunk(code_chunk)
  code_chunk.call
end
color = "blue"
say_color = Proc.new { puts "The color is #{color}" }

call_chunk(say_color)

ARRAY = [1, 2, 3]

def abc
  a = 3
end

def xyz(collection)
  collection.map { |x| yield x }
end

xyz(ARRAY) do
  p ARRAY
  p abc
  # p collection
  p a
end
