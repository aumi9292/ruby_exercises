#use arrays in an array to build a poem by prepending "This is" to phrases that build consecutively on each other to create the whole poem. A newline must be inserted between each new verse that's added to the poem. 

#data structures: array, string
#ex This is the house that Jack built. \n This is the malt that lay in the house that Jack built \n This is the rat that ate the malt that Jack built. \n

#alg
#iterate from the length of the outer array - 1 down to 0 
  #on each iteration, have the starting string 'This is'
  #

class House

  def self.recite
    poem = self.new
    poem.recite_poem
  end 

  def recite_poem
    final = []
    (pieces.length - 1).downto(0) do |idx|
      final << join_first_piece(idx)
    end 
    final.join("\n") 
  end 

  def join_first_piece(idx)
    (["This is"] + pieces[idx]).join(' ') + join_remainder_of_pieces(idx + 1) + "\n"
  end 

  def join_remainder_of_pieces(idx)
    final = []
    idx.upto(pieces.length - 1) do |inner|
        final << [" "] + pieces[inner]
    end 
    final.join("\n")
  end 

  private

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end