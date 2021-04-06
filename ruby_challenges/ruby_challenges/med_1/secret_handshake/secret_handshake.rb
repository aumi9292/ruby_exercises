class SecretHandshake
  CODE = {
    '1' => 'wink', '10' => 'double blink',
    '100' => 'close your eyes', '1000' => 'jump'
  }

  def initialize(init)
    @init = init
    @bin = init.instance_of?(String) ? valid : init.to_s(2)
  end

  def commands
    return [] if (bin.to_i).zero?
    CODE[bin] ? [CODE[bin]] : convert_binary
  end

  private

  attr_accessor :init, :bin

  def convert_binary
    bin = arr_of_bins.map { |dig| CODE[dig.to_s] }.compact
    arr_of_bins.include?(10000) ? bin.reverse : bin
  end

  def arr_of_bins
    bin.to_i.digits.map.with_index { |d, i| d * (10**i) }
  end

  def valid
    already_bin? ? init : 0
  end

  def already_bin?
    init.chars.all? { |char| ['0', '1'].include?(char) }
  end
end
