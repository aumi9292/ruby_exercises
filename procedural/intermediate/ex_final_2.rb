require 'minitest/autorun'

class Text
  def initialize(text)
    @text = text
  end

  def swap(letter_one, letter_two)
    @text.gsub(letter_one, letter_two)
  end
end

class TextTest < MiniTest::Test
  def setup
    @sample = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sed vulputate ipsum.
    Suspendisse commodo sem arcu. Donec a nisi elit. Nullam eget nisi commodo, volutpat
    quam a, viverra mauris. Nunc viverra sed massa a condimentum. Suspendisse ornare justo
    nulla, sit amet mollis eros sollicitudin et. Etiam maximus molestie eros, sit amet dictum
    dolor ornare bibendum. Morbi ut massa nec lorem tincidunt elementum vitae id magna. Cras
    et varius mauris, at pharetra mi."
    @text = Text.new(@sample)
    @swapped = @text.swap('a', 'e')
  end

  def test_swap
    assert_equal(@sample.gsub('a', 'e'), @swapped)
  end

  def test_word_count
    assert_equal(72, @sample.split(' ').count)
  end

  def test_raises_arg_error
    assert_raises { Text.new }
  end

  def teardown; end
end
