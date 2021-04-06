#problem: given a string that represents one or more codons (AUG --> Methionine, AUG UUU --> Meth, Phen.), parse apart the string into series of 3 (all codons for this exercise have length 3), translate them into their respective amino acids, and return that string representing 1 or more amino acids. 

#edge cases: must raise InvalidCodonError if given a string that does not represent a valid series of codons (e.g., 'carrot')
 #translation must stop if encounter a STOP codon--UAA, UAG, or UGA

#test cases
#define Translation class
#class method ::of_codon() that takes a single codon and translates it into the amino acid
#class method ::of_strand() that takes a string that is a concatenated series of codons. This must return an array of strings, where each string represents the translated amino acid from the given codon

#data structures--strings, hash, arrays
#I have access to the codon triplets, I will need access to the aminos. Hash with array of triplets as keys, string aminos as values 

class InvalidCodonError < StandardError
end 

class Translation

  TRANS = {
  ["AUG"] => "Methionine", 
  ["UUU", "UUC"] => "Phenylalanine", 
  ["UUA", "UUG"] => "Leucine", 
  ["UCU", "UCC", "UCA", "UCG"] => "Serine", 
  ["UAU", "UAC"] => "Tyrosine", 
  ["UGU", "UGC"] => "Cysteine", 
  ["UGG"] => "Tryptophan", 
  ["UAA", "UAG", "UGA"] => "STOP", 
}

  def self.of_codon(codon)
    TRANS.fetch(key_includes_codon(codon))
  end 

  def self.of_rna(strand)
    raise InvalidCodonError.new unless valid_strand?(strand) 
    
    strand.chars.each_slice(3).with_object([]) do |codon, fin|
      codon = codon.join
      of_codon(codon) == "STOP" ? (return fin) : (fin << of_codon(codon))
    end
  end  

  def self.valid_strand?(strand)
    strand.chars.each_slice(3).all? { |codon| valid_codon?(codon.join) }
  end 

  def self.valid_codon?(codon)
    TRANS.keys.any? { |key| key.include?(codon) }
  end 

  def self.key_includes_codon(cod)
    TRANS.keys.find { |k| k.include?(cod) }
  end 

  private_class_method :key_includes_codon, :valid_codon?, :valid_strand?
end 