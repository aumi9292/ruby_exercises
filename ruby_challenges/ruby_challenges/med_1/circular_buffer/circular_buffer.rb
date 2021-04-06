# implement a circular buffer that can of a varying length. The circular buffer should be implemented as an array. The starting position does not really matter, but if elements are added to the buffer, they should be added after the most recently added. If an element is deleted, the oldest elements should be deleted. If a buffer is full, the user can either not add any elements or overwrite the oldest elements with the newest elements. In this case, if an element is deleted afterward, it is the newer oldest element in the buffer.
# A user can write a value to the newest idx, read the element at the oldest indx, clear the entire buffer, write! to overwrite the current oldest value in a full buffer,
# Edge cases: nil objects should not be in allowed in the buffer, they are simply discarded.
# CircularBuffer::BufferEmptyException should be thrown if a user tries to read a buffer with no values
# CircularBuffer::BufferFullException should be raised if a user tries to add data into a full buffer

# data structures: Array (buffer), strings (elements), CircularBuffer objects

# tests
# define CircularBuffer class, CircularBuffer#initialize to take one Integer arg to set the buffer size
# define CB#read to read AND delete the oldest value from the buffer (raises BufferEmpty expt if no elements)
# define CB#write to add another element to the end of the buffer (ignores nil, raises buffer full expt if full)
# define CB#write! that will override the Buffer Full exception and overwrite the oldest element

['', '', '']
['a', '', '']

# alg
# initialize buffer objects as an Array with the size passed to #initialize
# the default object at each index should be an empty string Buffer.new(3) --> ['', '', '']
# initialize @open_spot = 0, which will indicate the index at which new elements should be added buf.write('hey') --> ['hey', '', '']
# initialize @open_spot = 0, which will be incremented each time someting is written
# increment @open_spot each time #write is called
# when oldest == buffer.size, oldest = 0 again
# buf.write('ab') --> ['hey', 'ab', '']
# read: @oldest instance variable, set to 0 originally
# read will slice off the element at @oldest_idx, returning it. #read will also increment @last_read and return to 0 if @last_read == buffer.size
# write! method will override the BufferFull error and write to the oldest element in the buffer,

class CircularBuffer
  class BufferEmptyException < StandardError
  end

  class BufferFullException < StandardError
  end

  def initialize(size)
    @buffer = Array.new(size) { "" }
    @open_idx = 0
    @oldest_idx = 0
  end

  def read
    raise BufferEmptyException if empty_buffer?

    to_read = buffer.slice(oldest_idx)
    buffer[oldest_idx] = ''
    increment_oldest_idx
    to_read
  end

  def write(data)
    return if data.nil?
    raise BufferFullException if buffer_full?

    buffer[open_idx] = data
    increment_open_idx
  end

  def write!(data)
    return if data.nil?
    return write(data) unless buffer_full?

    buffer[oldest_idx] = data
    increment_oldest_idx
    increment_open_idx
  end

  def clear
    reset_indexes
    buffer.map! { |_| '' }
  end

  private

  attr_accessor :buffer, :open_idx, :oldest_idx

  def increment_oldest_idx
    self.oldest_idx = oldest_idx == buffer.size - 1 ? 0 : oldest_idx + 1
  end

  def increment_open_idx
    self.open_idx = open_idx == buffer.size - 1 ? 0 : open_idx + 1
  end

  def empty_buffer?
    buffer.all?(&:empty?)
  end

  def buffer_full?
    buffer.all? { |el| el.length.positive? }
  end

  def reset_indexes
    self.open_idx = 0
    self.oldest_idx = 0
  end
end
