class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    recordings << recording
  end

  def listen
    record(yield) if block_given?
  end

  def listen(&recording)
    record(recording.call) if recording
  end

  def play
    puts recordings.last
  end

  private

  attr_reader :recordings
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"

# yielding to an implicit block versus passing in a proc and invoking the Proc#call method on it
# private accessor method

# 2 sample text file
class TextAnalyzer
  def initialize
    @text_file = File.read("sample.txt")
  end

  def process
    puts yield(text_file)
  end

  private

  attr_reader :text_file
end

analyzer = TextAnalyzer.new
analyzer.process { |file| "#{file.split(' ').length} words" }
analyzer.process { |file| "#{file.lines.length} lines" }
analyzer.process { |file| "#{file.split(/\n\n/).length} paragraphs" }

# missteps
# File.open("sample.txt", "r")
# process after finding File.read('file_name.txt'): splitting the file by spaces and then calling length on that array to find the number of words
# copying this block and altering it to work for the number of lines
# copying the first, trying .split("\n\n").length, getting unexpected return value asking for regex, changing the argument into split to a regex
# moving puts from each block to the method definition

# points of confusion--this does not open or close a File object--but I read a file object.

# first attempt at both of these problems
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
