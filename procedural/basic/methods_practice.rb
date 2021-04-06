[1, 2, 3].select do |num|
  num > 5
  'hi'
end
# returns the original [1, 2, 3], it returns all elements for which the final expression ('hi') evaluates to true

p %w(ant bat caterpillar).size do |str|
  str.length < 4
end

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
