# write a program that counts all words in the phrase and has a return value of k-v pairs as in word: count

# test implications
# define a class Phrase
# define an initialize method that takes one arg
# assigns arg to instance variable @phrase

# define instance method word_count that
# returns a hash with k-v pairs String_object => Integer_object
# clean string
# iterate through the string, substitute any char that is not a-z0-9'\s/-i with ''
# split string into array of words (delimited by spaces)
# create final hash
# iterate over each word
# if the word is in the hash, increm the value, otherwise
# hsh[word] = 1
# return hash

# rules:
# only alphanumeric characters should be returned as words
# clean the string to delete
# punctuation (including :)-- apostrophes should count as words (anywhere)
# \n \t

class Phrase
  def initialize(phrase)
    @phrase = phrase
    @cleaned = clean(phrase)
  end

  def word_count
    cleaned.split.each_with_object({}) do |word, hsh|
      hsh.member?(word) ? hsh[word] += 1 : hsh[word] = 1
    end
  end

  private

  def clean(str)
    str = str.gsub(/,/, ' ')#.squeeze(' ') #deal with commas and no spaces
    str = str.gsub(/[^a-z0-9'\s]/i, '').downcase #remove all punctuation
    str.gsub(/(\s')|('\s)/, ' ') #remove apostrophes at beginning/end of words
  end

  attr_reader :phrase
  attr_accessor :cleaned
end
