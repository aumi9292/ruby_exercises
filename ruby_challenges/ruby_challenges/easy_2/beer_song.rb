#define a class BeerSong
#define an instance method called verse that can take a splat number of arguments that each represent that verse in the 99 bottles of beer song 
#99 means just starting, 99 to 98 left
#3 means 3 down to 2 left 
#1 means 1 down to no more bottles of beer
#0 means no more to go to the store to buy some more

#output should be in the form of two strings that each have a trailing newline 

#define a lyrics method to output the entire song from 99 down to 0 

#from the specified argument to 1 - the final argument, output each verse when splat arguments are received 

class BeerSong 

  def verses(upper, lower)
  end 

  def verse(line)
    phrase = ""
    bottles = line.to_i 
    return zero_bottles if bottles == 0 
    bottles.downto(bottles) do |b_count|
      phrase << "#{b_count} #{s_no_s(b_count)} of beer on the wall, #{b_count} #{s_no_s(b_count)} of beer.\n"
      phrase += b_count > 1 ? one_or_more_bottles_left(b_count) : no_bottles_left
    end 
    phrase
  end 

  def one_or_more_bottles_left(b_count)
    "Take one down and pass it around, #{b_count - 1} #{s_no_s(b_count - 1)} of beer on the wall.\n"
  end 

  def no_bottles_left 
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end 

  def zero_bottles
    "No more bottles of beer on the wall, no more bottles of beer.\n" + 
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end 

  def s_no_s(b_count)
    b_count == 1 ? "bottle" : "bottles"
  end 

end 