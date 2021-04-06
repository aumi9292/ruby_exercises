arr = [1, 3, 5, 7, 9, 11] 
number = 3

def checker(array, num)
  array.each do |el|
    return true if el == num 
  end 
end

puts checker(arr, 14)

new_arr = arr.map {|el| el*2}
puts new_arr

nums = [4, 7, 3, 2, 6, 9, 10, 110, 4]

def check(array, num)
  array.include?(num)
end 
puts check(nums, 10)

def check2(array, num)
  included = array.select {|el| el == num}
  included.length > 0 
end 

puts check2(nums, 4)

nums.each_with_index {|value, index| puts "#{index+1}. #{value}"}

nums2 = nums.map{ |el| el + 2 }

p nums2
p nums