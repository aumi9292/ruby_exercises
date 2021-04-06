#step 1
#convert a binary, four-row font that uses pipes and underscores to form a 1 or 0 to their equivalent 1s or 0s strings. Return a / is the format is correct (four rows high by 3 columns wide) but not a 0 or 1, or an error if the format is not correct 
#tests
  #write a class OCR that takes the formatted numeric text and saves it as in instance var
  #write a OCR#convert method that returns the equiv string, a ?, or an error depending on input 
#ex
=begin 
    _
|  | |
|  |_|
 
=end 

#alg
#split the string into an array of rows
  #iterate through each row, check 
    #there are four rows, each with a length of 3 characters
  #if not, return error

  #if yes, check that the third position in each row == \ OR the first row == _ , the second == | | , the third == |_|, and the fourth is empty 

  require 'pry'
  class OCR 
    def initialize(ocr)
      @ocr = ocr
      @ints = @ocr.split("\s\s\s")
      @int_rows = @ints.map {|int| int.split("\n") }
    end 

    def split_into_ints
      arr = @ocr.split(/"\n"/)
      div_length = arr.map(&:length).max / 2 
      re_arranged = []
      0.step(by: div_length, to: arr.length - div_length) do |i|
        new_row = []
        arr.each do |mixed|
          new_row << mixed[i, div_length]
        end
        re_arranged << new_row
      end
      re_arranged
    end 

    def convert
      binding.pry
      @int_rows.map { |row| convert_int(row) }.join
    end 

    def convert_int(int)
      case int
      when [" _", "| |", "|_|"] then '0'
      when ["", "  |", "  |"] then '1'
      when [" _", " _|", "|_"] then '2'
      when [" _", " _|", " _|"] then '3'
      when ["", "|_|", "  |"] then '4' 
      when [" _", "|_", " _|"] then '5'
      when [" _", "|_", "|_|"] then '6'
      when [" _", "  |", "  |"] then '7'
      when [" _", "|_|", "|_|"] then '8'
      when [" _", "|_|", " _|"] then '9'
      else 
        '?'
      end 
    end 

  end 

  text = <<-NUMBER.chomp
    _
  || |
  ||_|
      
    NUMBER

  OCR.new(text).convert