# given a word and a list of possible anagrams, return a sorted list of words that are anagrams of the given word.
# rules
# case insensitive
# the given anagram will not have any spaces
# the returned list must be in alphabetical order

# define a class Anagram
# define an initialize that takes 1 arg--a string

# define instance method #match that is called on an Anagram object and takes an array of words as an argument, and returns a equal or smaller array of all words that are anagrams of the given word in the anagram object

class Anagram
  def initialize(an)
    @an = an.downcase
  end

  def match(arr)
    arr.each_with_object([]) { |word, final| final << word if valid?(word) }
  end

  private

  attr_reader :an

  def valid?(word)
    anagram?(word) && not_same?(word)
  end

  def anagram?(to_check)
    an.chars.sort == to_check.downcase.chars.sort
  end

  def not_same?(to_check)
    an != to_check.downcase
  end
end
