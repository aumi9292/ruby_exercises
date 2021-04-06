# given a word, return its total scrabble score
# return 0 if given empty string, spaces, or nil
# what if the word includes punctuation? just don't count that word?
# maybe gsub everything that's not a-zA-Z with ''

SCORING = {
  'A, E, I, O, U, L, N, R, S, T' => 1,
  'D, G' => 2,
  'B, C, M, P' => 3,
  'F, H, V, W, Y' => 4,
  'K' => 5,
  'J, X' => 8,
  'Q, Z' => 10
}

class Scrabble
  def initialize(word)
    @word = word
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  def score
    zero_score?(word) ? 0 : calculate_pts
  end

  private

  attr_reader :word

  def calculate_pts
    word.chars.map { |char| select_points(char) }.sum
  end 

  def zero_score?(word)
    word.nil? || word.strip.length.zero?
  end

  def select_points(char)
    SCORING[SCORING.keys.find { |k| k.include?(char.upcase) }]
  end

end
