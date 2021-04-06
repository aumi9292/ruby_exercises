require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class NoExperienceError < StandardError
end

class Example
  attr_accessor :employee

  def initialize
    @employee = 'employee'
  end

  def value
    9
  end

  def hire
    raise NoExperienceError
  end

  def process(arr)
    arr
  end
end

class ExampleTest < MiniTest::Test
  attr_accessor :value, :lowercase, :nothing, :arr, :list, :int

  def setup
    @value = 9
    @lowercase = 'HELLO'
    @nothing = nil
    @arr = []
    @list = ['xyz', 'aaa', 'bbb']
    @int = 20
  end

  def process
    list
  end

  def test_value_odd?
    assert_equal(true, value.odd?)
  end

  def test_downcase
    assert_equal('hello', lowercase.downcase)
  end

  def test_nothing_is_nil
    assert_nil(nothing)
  end

  def test_arr_is_empty
    assert_empty(arr)
  end

  def test_list_includes_xyz
    assert_includes(list, 'xyz')
  end

  # def test_raises_error
  #   assert_raises(NoExperienceError) { employee.hire }
  # end

  def test_int_instance_of_integer
    assert_instance_of(Integer, int)
  end

  def test_int_kind_of_numeric
    assert_kind_of(Numeric, int)
  end

  # def test_process_returns_same_objects
  #   assert_same(list, list.process)
  # end
  def test_xyz_not_in_arr
    refute_includes(list, 'ttt')
  end
end
