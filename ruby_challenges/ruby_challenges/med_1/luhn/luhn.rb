# check a given integer according to a luhn algorithm.
# split the integer into an array of digits
# from -2 stepping down to arr.length by -2
# multiply the digit at that index by 2
# if it is > 9, subtract 9
# else nothing (addends)
# sum this altered array of digits (checksum)
# check if checksum % 10 is zero?

class Luhn
  attr_accessor :int, :arr

  def initialize(int)
    @int = int
    @arr = int.clone.digits.reverse
  end

  def addends
    -2.step(-arr.length, -2).with_object(arr) do |idx, arr|
      arr[idx] = double_sub_nine(arr[idx])
    end
  end

  def checksum
    addends.sum
  end

  def valid?
    (checksum % 10).zero?
  end

  def self.create(num)
    check = Luhn.new(num)
    0.upto(9) do |i|
      interm = Luhn.new((check.arr + [i]).join.to_i)
      return interm.int if interm.valid?
    end
  end

  private

  def double_sub_nine(int)
    int > 4 ? int * 2 - 9 : int * 2
  end
end
