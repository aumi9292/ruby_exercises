#problem: given a string of all kinds of characters, return an encoded version of the string where 
  #all characters are downcased
  #all non a-z0-9 characters are removed
  #all spaces are removed 
  #the cleaned string's characters are then arranged into a square if possible or a rectangle otherwise, and then characters at the same column in corresponding rows are joined together 
      #text should be split into a set of rows stacked on top of each other 
      #"Nevervexthineheartwithidlewoes" is 30 chars, square root of 30 is 5.47 (rounds up to 6), length of string (30) / rounded_square (6) is 5--this is the number of inner arrays (rows)
        #string length - size downto size stepping down by size, add a space "Neverv exthin eheart withid lewoes" 
            #str.length - size.step(size, size) do |n| #txt.insert(txt.length - n, ' ')
        #split the new string by default space  ["Neverv"], ['exthin'] ['eheart'] ['withid'] ['lewoes']
        #push all of these arrays into a grid_array [["Neverv", ['exthin'] ['eheart'] ['withid'] ['lewoes']]
        #init final_encrypted array
        #from 0 up to size - 1, iterate over each inner array
          #init word_array for each encrpyted set of characters
          #if the charactater exists at that index, push it to word_array 
          # at the last iteration for each index, push word_array into final_encrypted [['Neewl'], ['extetw']]
        #flatten 2d array and join with spaces 
  #a single string with these newly arranged series of characters is the encoded message 

  #in: string #out: string 
  #data: strings, arrays (2d), integers (for lengths of strings)

class Crypto
  def initialize(msg)
    @msg = msg
    @cleaned = normalize_plaintext
    @length = cleaned.length
    @segs = plaintext_segments
  end 

  def normalize_plaintext
    msg.downcase.gsub(/[^a-z0-9]/, '')
  end 

  def size
    (cleaned.length ** 0.5).ceil 
  end 

  def plaintext_segments
    final = 0.step(length, size).with_object([]) do |idx, final|
      final << cleaned[idx, size]
    end
    final.reject { |el| el.empty? }
  end 

  def ciphertext
    final = ''

    0.upto(segs.first.length - 1) do |idx|
      segs.each do |inner|
        break unless inner[idx]
        final << inner[idx]
      end 
    end 
    final 
  end 

  def normalize_ciphertext
    final = ''
    0.upto(ciphertext.length - 1) do |idx|
      final << ' ' if idx > 1 && (idx % (size - 1)).zero?
      break unless ciphertext[idx]
      final << ciphertext[idx]
    end 
    final 
  end 

  private 

  def msg 
    @msg.clone 
  end

  attr_reader :cleaned, :length, :segs 

end 

#test case implications
  #define a CryptoTest class
    #define an initialize method that takes one string as an argument 
    
    #define a method called normalize_plaintext to clean the string (downcased, only a-z0-9, remove spaces)

    #override the String#size method in CryptoTest class by defining a new #size method that returns the length of normalize_plaintext ** 0.5 (sq root)
      #if whole integer
        #-- return whole integer 9, 3; if 12, 4
      #elsif not perfect square
        #--round up to the nearest whole integer (if 5, 3; if 2, 1; if 10, 4)

    #define a Crypto#plaintext_segments method "hello" -- ["hel", 'lo']
      #called on a Crypto object, takes no args, returns an Array of substrings that represent inner arrays
        #init a final array
        #0 up to the plaintext.size - size, 
        #string[index, size] into final array

    #define a Crypto#ciphertext method "hello" -- "hleol"
      #call on a Crypto, returns a string with no spaces of strings that have been encoded 
      #init final string
      #using the return value of #plaintext_segments (Array of strings)
        #from 0 up to Crypto#size - 1, (use as index) access 
          #each plaintext_segment at that index and push into final string

    #define Crypto#normalize_ciphertext "hello" -- 'hle ol'
    #called on a Crypto, returns a string with spaces
      #init final string
      #init counter at 0
      #loop over return value of ciphertext ('hleol')
        #if index is a multiple of size-1, push a space into the final string 
        #push the character at string[index] into final 
        #break if the counter == ciphertext.length - size




#leena's
=begin

class Crypto
  def initialize(input)
    @decoded = input #version 1 just to keep in mind that we're getting input
  end

  def normalize_plaintext
  # - Remove spaces and punctuation from input. 
  # - Downcase input.
  # - Returns a normalized string object
  # Idea, regex for only alphanumeric characters  (step 1)
  end

  def size
    # This is to determine the square (or next perfect square)
    # size. 
    #  Math.sqrt(text_size).ceil (to return either perfect or next perfect)
    #  (step 2)
  end

  def plaintext_segments
    # Row for squares and text (step 3)
  end

  def ciphertext
    # this is the cipher, just joined, without spaces (step 4)

  end

  def normalize_ciphertext
    # this is the cipher text, but with spaces between each 'word' (step 4)
  end

  attr_reader :decoded
end 

Step 1: Normalization
  - Remove spaces and punctuation from input. 
  - Downcase input.
  - Returns a normalized string object

Step 2: Determine Square Size 
  - Get normalized string objet's length
    - Is it a perfect square ? Go to step 3.1
    - If not a perfect square, go to step 3.2

Step 3: Row for squares and text
  3.1 If it's a perfect square, find the integer (n) that, multiplied by itself returns the perfect square. (n * n = perfect square)

  You will take the first n characters from the normalized string and print it on the row
  Repeat until you have printed n number of rows with the subsequent charaters 

  *This could be a 2D array 

  Array#slice or String#slice -> we're looking only for the elements, not the data structure

  3.2. 
  Find the next perfect square and use this to create the rows and determine the quantity of characters per row.


Step 4: Print Pattern for Encrypted Message (normalized) 
  To encrypt the message, start by taking the first element of each sub-array -> first word

  Add a space between words 
  
  If there are no letters in the other arrays at the same position, move to the next work creation   

Step 4/2: Print Pattern for Encrypted Message (ciphertext) 
Like step 4 without the spaces in between.


Design Ideas:
- Call the methods instead OR create instance variables for the return values 
- attr_reader :decoded
 
=end





#challenges
  #falling into implementation level details too early
    #opp: recognize what I think will be hard, note it, move on, circle back 
  #getting lost in a big problem, moving bw levels of abstraction
    
  ##QUESTION: should .plaintext and .size be a method or an instance variable (with a getter method) that belongs to each crypto object? 


=begin #why does normalized return nil/
class Crypto
  def initialize(input)
    @message = input
  end
  
  def normalize_plaintext
    to_normalize = message.clone 
    self.normalized = to_normalize.downcase.gsub(/[^a-z0-9]/, '')
  end
  
  def size
    Math.sqrt(normalized.length).ceil
  end
  
  private 
  attr_reader :message, :normalized

end
=end

=begin



class Crypto
  def initialize(input)
    @message = input
  end
  
  def normalize_plaintext
    to_normalize = message.clone 
    normalized = to_normalize.downcase.gsub(/[^a-z0-9]/, '')
  end
  
  def size
    Math.sqrt(normalize_plaintext.length).ceil
  end
  
  def plaintext_segments
    final = []
    
    start_idx = 0 
    segment = size 
    counter = 0 
    
    loop do
      final << normalize_plaintext[start_idx, segment]
            
      counter += 1 
      start_idx = segment * counter
      break if start_idx >= normalize_plaintext.length
      
    end
    final 
  end
  
  def ciphertext
   text = plaintext_segments
    final = []
    
    text.size.times do |iteration|
        encrypted_word = ''
      
        text.each do |word|
          break if word[iteration].nil?
          encrypted_word += word[iteration] 
        end
      final << encrypted_word
    end
    
    final.join
  end

  def normalize_ciphertext
    final = ''
    counter = 0 
    text = ciphertext
    spaces = 0 
    loop do
      if (counter % (size-1)).zero? && counter > 1 
        final << ' ' 
        spaces += 1 
      end 
      final << text[counter] 
      counter += 1 
      break if text.length + spaces == final.length  #text[counter].nil?
    end
      final 
  end
  
  private 
  attr_reader :message

end



require 'minitest/autorun'

class CryptoTest < Minitest::Test
  def test_normalize_strange_characters
    crypto = Crypto.new('s#$%^&plunk')
    assert_equal 'splunk', crypto.normalize_plaintext
  end

  def test_normalize_uppercase_characters
    crypto = Crypto.new('WHOA HEY!')
    assert_equal 'whoahey', crypto.normalize_plaintext
  end

  def test_normalize_with_numbers
    crypto = Crypto.new('1, 2, 3 GO!')
    assert_equal '123go', crypto.normalize_plaintext
  end

  def test_size_of_small_square
    crypto = Crypto.new('1234')
    assert_equal 2, crypto.size
  end

  def test_size_of_slightly_larger_square
    crypto = Crypto.new('123456789')
    assert_equal 3, crypto.size
  end

  def test_size_of_non_perfect_square
    crypto = Crypto.new('123456789abc')
    assert_equal 4, crypto.size
  end

  def test_size_is_determined_by_normalized_plaintext
    crypto = Crypto.new('Oh hey, this is nuts!')
    assert_equal 4, crypto.size
  end

  def test_plaintext_segments
    crypto = Crypto.new('Never vex thine heart with idle woes')
    expected = %w(neverv exthin eheart withid lewoes)
    assert_equal expected, crypto.plaintext_segments
  end

  def test_other_plaintext_segments
    crypto = Crypto.new('ZOMG! ZOMBIES!!!')
    assert_equal %w(zomg zomb ies), crypto.plaintext_segments
  end

  def test_ciphertext
    crypto = Crypto.new('Time is an illusion. Lunchtime doubly so.')
    assert_equal 'tasneyinicdsmiohooelntuillibsuuml', crypto.ciphertext
  end

  def test_another_ciphertext
    crypto = Crypto.new('We all know interspecies romance is weird.')
    assert_equal 'wneiaweoreneawssciliprerlneoidktcms', crypto.ciphertext
  end

  def test_normalized_ciphertext
    crypto = Crypto.new('Vampires are people too!')
    assert_equal 'vrel aepe mset paoo irpo', crypto.normalize_ciphertext
  end

  def test_normalized_ciphertext_spills_into_short_segment
    crypto = Crypto.new('Madness, and then illumination.')
    expected = 'msemo aanin dnin ndla etlt shui'
    assert_equal expected, crypto.normalize_ciphertext
  end

  def test_another_normalized_ciphertext
    crypto = Crypto.new(
      'If man was meant to stay on the ground god would have given us roots',
    )
    expected = 'imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn sseoau'
    assert_equal expected, crypto.normalize_ciphertext
  end

  def test_normalized_ciphertext_with_punctuation
    crypto = Crypto.new('Have a nice day. Feed the dog & chill out!')
    expected = 'hifei acedl veeol eddgo aatcu nyhht'
    assert_equal expected, crypto.normalize_ciphertext
  end

  def test_normalized_ciphertext_when_just_less_then_a_full_square
    crypto = Crypto.new('I am')
    assert_equal 'im a', crypto.normalize_ciphertext
  end
end

=end 
