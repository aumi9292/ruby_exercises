# -character set with letters, spaces, and a point. words counsist of 1-20 chars, they are separated by 1+ spaces (squeeze spaces), followed by a point. 
# -input should be read from the first letter of word 1 to the terminating point. 
# -output should be each word separated by a single space with the final word being terminated by a single point
# -string to cleaned string with 1 space delimiting words and with words that show in an odd index order reversed
# "hi   hello  bobby." --> "hi olleh bobby."
#data: strings, array, string 
ex1 = "hi   hello  bobby."
ex2 = "What's the matter with Kansas."

#alg
#1. split the string by spaces
#2. iterate over the array of words, noting each idx
  #3. if the idx is odd, return the word.reversed
  #4. if the idx is even, return the word 
#5. join the array elements together 

def odd_words(str)
  str.split(" ").map.with_index { |word, idx| idx.even? ? word : word.reverse }.join(" ")
end 

p odd_words(ex1)
p odd_words(ex2)

#bonus alg
#1. split string by spaces
#2. iterate over each word, noting index
  #2a. if idx of word is odd
    #2b reverse the word
  #3. split each word into chars
    #4. puts each character
    #5. sleep screen for .1 sec

def odd_bonus(str)
  str.split(" ").each_with_index do |word, idx|
    word = word.reverse if idx.odd?
    word.chars.each do |char|
      p char
      sleep(0.1)
    end 
  end
end 

odd_bonus(ex1)
odd_bonus(ex2)

#missed multiple spaces preceding final period--just delete the final char from the original str (it will be a period, then carry out original alg, then append period at the end )