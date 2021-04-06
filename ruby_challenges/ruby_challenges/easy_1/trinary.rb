#problem--given a string of digits that represents a trinary number, return an integer in base 10 of that trinary string 
#in: string representing trinary number
#out: base 10 integer 
#only valid digits are 0, 1, and 2. Input with any invalid digits should automatically return 0 

#test implications
#define class Trinary 
  #define initialize method that takes 1 string 

  #define instance method #to_decimal that is called on a Trinary object, accesses the trinary string, and converts it to a base 10 integer

    #iterate over each character in the string '10'
    #at each character, check if the character is equal to the return value of chaining to_i to _s. 
      #if any are not--end execution and return 0
      #if all are--
      #reverse the array 
        #iterate over each char again, noting the index ['0', '1']
        #convert the char to an integer [0, 1]
        #multiply each integer by (3 ** integer) [0, 3]
        #sum the array 3

class Trinary 

  attr_accessor :tri 

  def initialize(tri)
    @tri = tri 
  end

  def to_decimal
    return 0 if tri.chars.any? {|char| char.to_i.to_s != char }
    tri.chars.map(&:to_i).reverse.map.with_index {|el, i| el * (3 ** i )}.sum 
  end
end 