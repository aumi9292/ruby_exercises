# if a word begins with a vowel, add an 'ay' to end of the string
# if a word begins with a consonant, remove the consonant, add ay to it, concat it with the word
# all lowercase tests

class PigLatin
  TWO_CLUSTERS = ["th", "qu", "ch"]
  THREE_CLUSTERS = ["sch", "thr", "squ"]
  VOWEL_LIKE_CHARS = /(^[aeiou])|(^yt)|(^xr)/

  def self.translate(eng)
    eng.split(" ").map { |wrd| translate_word(wrd) }.join(" ")
  end

  def self.translate_word(wrd)
    choose_c_or_v(wrd)
  end

  def self.choose_c_or_v(eng)
    eng.downcase =~ VOWEL_LIKE_CHARS ? v_translate(eng) : c_translate(eng)
  end

  def self.v_translate(str)
    str + 'ay'
  end

  def self.c_translate(str)
    ending = str.slice!(0..calculate_prefix_length(str)) + 'ay'
    str + ending
  end

  def self.calculate_prefix_length(str)
    if THREE_CLUSTERS.any? { |clst| str.start_with?(clst) }
      2
    elsif TWO_CLUSTERS.any? { |clst| str.start_with?(clst) }
      1
    else
      0
    end
  end

  private_class_method :translate_word, :choose_c_or_v, :v_translate, :c_translate, :calculate_prefix_length
  end
