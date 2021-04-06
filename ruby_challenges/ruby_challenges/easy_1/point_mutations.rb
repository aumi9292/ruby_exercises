# given two strings, compute the number of indexes that are not equal, based on the shorter of the given strings.
# 'CCA', "CAA" -- Hamming distance of 1
# rules: empty string should return 0
# only check up to the length of the smaller string

# test implications:
# define a class DNA
# define an initialize method that takes a string that represents a strand of dna (@strand)

# define an instance method DNA#hamming_distance that takes a string object that is the strand to compare to the calling object/strand of the calling object
# implementation
# label the two strings--shorter and longer
# place both in an array
# sort by el.length
# unpack syntax shorter, longer = [].sort_by {el.length}
# initialize a final count
# iterating over the shorter string, keeping track of index,
# check to see if the current char == string[index]
# if yes: increment final count
# if not: go to next char

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other)
    pair(other).count { |a, b| a != b }
  end

  private

  def sort_and_pair(other)
    [other, strand].sort_by(&:length)
  end

  def pair(other)
    arr_chars = sort_and_pair(other).map(&:chars)
    arr_chars.first.zip(arr_chars.last)
  end

  attr_reader :strand
end
