# frozen_string_literal: true

letters_and_numbers = { 'a' => 1, 'b' => 2, 'c' => 3, 'd' => 5 }

hsh = letters_and_numbers.select do |_letter, num|
  num < 4
end

p hsh
def greet
  a = 'hi'
end

greet
