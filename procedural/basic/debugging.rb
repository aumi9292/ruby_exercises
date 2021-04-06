# frozen_string_literal: true

# # frozen_string_literal: true

# def decrease(counter)
#   counter - 1
# end

# 10.downto(1) { |n| puts n }

# puts 'LAUNCH!'

# def move(n, from_array, to_array)
#   return if n == 0

#   to_array << from_array.shift
#   move(n - 1, from_array, to_array)
# end

# # Example

# TODO: = ['study', 'walk the dog', 'coffee with Tom']
# done = ['apply sunscreen', 'go to the beach']

# move(5, todo, done)

# p todo # should be: ['coffee with Tom']
# p done

# # password
# password = nil

# def set_password
#   puts 'What would you like your password to be?'
#   new_password = gets.chomp
#   password = new_password
# end

# def verify_password(password)
#   puts '** Login **'
#   print 'Password: '
#   input = gets.chomp

#   if input == password
#     puts 'Welcome to the inside!'
#   else
#     puts 'Authentication failed.'
#   end
# end

# password ||= set_password

# verify_password(password)

# # guessing game
# def valid_integer?(string)
#   string.to_i.to_s == string
# end

# def guess_number(max_number, max_attempts)
#   winning_number = (1..max_number).to_a.sample
#   attempts = 0

#   loop do
#     input = nil
#     until valid_integer?(input)
#       print 'Make a guess: '
#       input = gets.chomp
#     end

#     guess = input.to_i

#     if guess == winning_number
#       puts 'Yes! You win.'
#     elsif guess < winning_number
#       puts 'Nope. Too small.'
#     else
#       puts 'Nope. Too big.'
#     end
#     # Try again:
#     attempts += 1
#     break if attempts > max_attempts
#   end

#   guess_number(max_number, max_attempts)
# end

# guess_number(10, 3)

# You are given an array strarr of strings and an integer k. Your task is to return the first longest string consisting of k consecutive strings taken in the array.

# #Example: longest_consec(["zone", "abigail", "theta", "form", "libe", "zas", "theta", "abigail"], 2) --> "abigailtheta"

# n being the length of the string array, if n = 0 or k > n or k <= 0 return "".

# problem: Given an array of strings, return a string that consists of the specified number of longest strings concatenated into one string
# in: arr  #out: string
# rules:
# return "" if num is neg, -, or less than the length of the array
# return "" if array length is 0
# if multiple combos have the same length, return the first combination

# alg2
# 1. init str_combos array
# 2. iterate over array of words,
# at each index, grab the number of of elements specified by k
# join them together
# push this joined str into combos array
# 3. use max_by to select the max by the length of the element

def longest_consec(arr, length)
  str_combos = []
  arr.each_index do |index|
    str_combos << (arr[index, length]).join
    break if index == arr.length - length
  end
  str_combos
end

# alg
# 1. init final str
# 2. sort arr by the size of the string at each index, reverse it
# init counter
# 3. init loop
# 4. push the element at the index specified by counter into the final str
# 5. increment counter
# 6. exit the loop if counter is equal to the specified number
# 7. return the final str

# def longest_consec(arr, length)
#   final = ''
#   return final if arr.length.zero? || arr.length < length || length <= 0

#   arr = arr.sort_by(&:length).reverse
#   counter = 0
#   loop do
#     break if counter <= length

#     final += arr[counter]
#     counter += 1
#   end
#   final
# end

%w[a, ab, abc, d, ee]
#iterate over array
  #for objects at each index, iterate over the remainder of the array

p longest_consec(%w[a ab abc d ee abcde bbb], 6) #== "ababcdeeabcdebbb"
p longest_consec(%w[zone abigail theta form libe zas], 2) #== 'abigailtheta'
p longest_consec(%w[ejjjjmmtthh zxxuueeg aanlljrrrxx dqqqaaabbb oocccffuucccjjjkkkjyyyeehh], 1) == 'oocccffuucccjjjkkkjyyyeehh'
p longest_consec([], 3) == ''
p longest_consec(%w[itvayloxrp wkppqsztdkmvcuwvereiupccauycnjutlv vweqilsfytihvrzlaodfixoyxvyuyvgpck], 2) #== 'wkppqsztdkmvcuwvereiupccauycnjutlvvweqilsfytihvrzlaodfixoyxvyuyvgpck'
p longest_consec(%w[wlwsasphmxx owiaxujylentrklctozmymu wpgozvxxiu], 2) == 'wlwsasphmxxowiaxujylentrklctozmymu'
p longest_consec(%w[zone abigail theta form libe zas], -2) == ''
p longest_consec(%w[it wkppv ixoyx 3452 zzzzzzzzzzzz], 3) == 'ixoyx3452zzzzzzzzzzzz'
p longest_consec(%w[it wkppv ixoyx 3452 zzzzzzzzzzzz], 15) == ''
p longest_consec(%w[it wkppv ixoyx 3452 zzzzzzzzzzzz], 0) == ''

