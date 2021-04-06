#write an Integer#to_roman method that is called on an integer object and returns the equivalent roman numeral as a string 
#1-I, 2-II, 3-III, 4-IV 5-V etc. 
#10-X, 20-XX, 30-XXX, 40-XL, 50-L
#100-C, 200-CC, 300-CCC, 400-CD, 500-D
#1000-M, 2k-MM, 3k-MMM
#only need up to 3000
#larger integers--start at the left
  #skip any 0
  #concatenate all numerals 
  #1990 -- [0, 9, 9, 1] -- [skip (ones), XC (10s), CM (100s), M (thousands)].reverse -- [M, CM, XC].join --'MCMXC'

  #create a data structure to represent roman numerals and their equivalent digits ONES = {'1' => 'I', etc. } 
  #PLACES = ['I', 'V', 'X', 'L', 'C', 'D', 'M'] [0, 9, 9, 1]
    #1-3 X * 3 = XXX (30)

    #1, 10, 100, 1000 --all even indexes
      #5, 50, 500 - all odd indexes
      #4, 9 - special combo of prior index + current_index (4 is I + V = IV)
  #split the given integer into digits, reversed [0, 9, 9, 1]
  #iterate over digits
  #next if 0 
  #otherwise, look up the corresponding numeral for that place of the digit
  #reverse the array
  #join to string 

  class Integer
    ROMANS = ['I', 'V', 'X', 'L', 'C', 'D', 'M']

    def to_roman
      roman_array.join 
    end 

    def roman_array
      int = self 
      strs = int.digits
      fin = strs.map.with_index do |int, idx|
        idx *= 2 if idx > 1 
        case int 
        when 0..3
          under_4(int, idx)
        when 4
          four(int, idx)
        when 5
          five(int, idx)
        when 6..8
          six_eight(int, idx)
        when 9 
          nine(int, idx)
        end 
      end
      fin.reverse
    end 

    def under_4(int, idx)
      idx += 1 if idx.odd? 
      ROMANS[idx] * int 
    end

    def four_nine(int, idx)
      idx += 1 if idx.odd? 
      ROMANS[idx] + ROMANS[idx + 1]
    end 

    def four(int, idx)
      idx += 1 if idx.odd? 
      ROMANS[idx] + ROMANS[idx + 1]
    end 

    def five(int, idx)
      idx += 1 if int == 5 
      ROMANS[idx]
    end 

    def six_eight(int, idx)
      idx += 1 
      ROMANS[idx] + (ROMANS[idx - 1] * (int - 5))
    end 

    def nine(int, idx)
      idx += 1 if idx.odd? 
      ROMANS[idx] + ROMANS[idx + 2]
    end 
    
  end 

