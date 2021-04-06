# frozen_string_literal: true

require 'date'
puts Date.new(2016)

def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)

a = [1, 4, 8, 11, 15, 19]
p a.bsearch_index { |el| el > 8 }
