class Cipher
  AL = ('a'..'z').to_a

  def self.encode(str)
    str = clean(str)
    str = translate(str).join
    str.length > 5 ? delineate(str) : str
  end

  def self.clean(str)
    str.downcase.gsub(/[^a-z0-9]/, '')
  end

  def self.translate(str)
    str.chars.map do |chr|
      chr.to_i.to_s == chr ? chr : AL[25 - AL.index(chr)]
    end
  end

  def self.delineate(str)
    str.chars.each_index.with_object('') do |idx, final|
      final << ' ' if idx > 0 && (idx % 5).zero?
      final << str[idx]
    end
  end
end
