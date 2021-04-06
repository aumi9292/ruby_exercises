# def fun_with_ids
#   a_outer = 42
#   b_outer = 'forty two'
#   c_outer = [42]
#   d_outer = c_outer[0]

#   a_outer_id = a_outer.object_id
#   b_outer_id = b_outer.object_id
#   c_outer_id = c_outer.object_id
#   d_outer_id = d_outer.object_id

#   puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
#   puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
#   puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
#   puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block."
#   puts

#   1.times do
#     a_outer_inner_id = a_outer.object_id
#     b_outer_inner_id = b_outer.object_id
#     c_outer_inner_id = c_outer.object_id
#     d_outer_inner_id = d_outer.object_id
# #also crazy, a and d, which both point to 42, have the same ids
#     #all of these ids are the same
#     puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer_inner_id} inside the block." # same ids, immutable integer
#     puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block." # diff ids, mutable strings
#     puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer_inner_id} inside the block." # diff ids?, mutable array
#     puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer_inner_id} inside the block." # diff ids, immutable integer
#     puts

#     # reassignment, except for d_outer

#     a_outer = 22
#     b_outer = 'thirty three'
#     c_outer = [44]
#     d_outer = c_outer[0]
# #immutable integers point to their own location in memory, 22 will always point to 22, 42 will always point to 42
#     puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after." # 22 before and after are different? or maybe the same
#     puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after." # "thirty three", before and after are different?
#     puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after." # [44], before and after are different
#     puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after." # 44, same?
#     puts

#     # reassinged to the above new values for a-d
#     a_inner = a_outer
#     b_inner = b_outer
#     c_inner = c_outer
#     d_inner = c_inner[0]
#     # ids are assigned to pointers of inner objects
#     a_inner_id = a_inner.object_id
#     b_inner_id = b_inner.object_id
#     c_inner_id = c_inner.object_id
#     d_inner_id = d_inner.object_id
# #all of these have the same ids
#     puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)." # 22 same ids
#     puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)." # "thirty three" diff ids
#     puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)." # [44] diff ids
#     puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer)." # 44 same id
#     puts
#   end
# #all of these object ids are different
#   puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block."
#   puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block."
#   puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block."
#   puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block."
#   puts
# #none of the below work,
#   begin
#     puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block."
#   rescue
#     puts 'ugh ohhhhh'
#   end
#   begin
#     puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block."
#   rescue
#     puts 'ugh ohhhhh'
#   end
#   begin
#     puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block."
#   rescue
#     puts 'ugh ohhhhh'
#   end
#   begin
#     puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block."
#   rescue
#     puts 'ugh ohhhhh'
#   end
# end

# fun_with_ids

# 2

def fun_with_ids
  a_outer = 42
  b_outer = 'forty two'
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block."
  puts

  an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the method call."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the method call."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the method call."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the method call."
  puts

  begin
    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the method."
  rescue
    puts 'ugh ohhhhh'
  end
  begin
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the method."
  rescue
    puts 'ugh ohhhhh'
  end
  begin
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the method."
  rescue
    puts 'ugh ohhhhh'
  end
  begin
    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the method."
  rescue
    puts 'ugh ohhhhh'
  end
  puts
end

def an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)
  # same ids for immutable objects (a outer and d outer), diff ids for mutable objects? b, c?
  # nope, same ids for all objects
  puts "a_outer id was #{a_outer_id} before the method and is: #{a_outer.object_id} inside the method."
  puts "b_outer id was #{b_outer_id} before the method and is: #{b_outer.object_id} inside the method."
  puts "c_outer id was #{c_outer_id} before the method and is: #{c_outer.object_id} inside the method."
  puts "d_outer id was #{d_outer_id} before the method and is: #{d_outer.object_id} inside the method."
  puts

  a_outer = 22
  b_outer = 'thirty three'
  c_outer = [44]
  d_outer = c_outer[0]
  # all after reassignment should be different object ids
  puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
  puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
  puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
  puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."
  puts
  # setting variables within a method, will only exist in the method
  a_inner = a_outer
  b_inner = b_outer
  c_inner = c_outer
  d_inner = c_inner[0]

  a_inner_id = a_inner.object_id
  b_inner_id = b_inner.object_id
  c_inner_id = c_inner.object_id
  d_inner_id = d_inner.object_id

  # same ids as outer variable objects?
  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the method (compared to #{a_outer.object_id} for outer)."
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the method (compared to #{b_outer.object_id} for outer)."
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the method (compared to #{c_outer.object_id} for outer)."
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the method (compared to #{d_outer.object_id} for outer)."
  puts
end

fun_with_ids

def tricky_method(a_string_param)
  a_string_param += 'rutabaga'
end

def tricky_method_two(an_array_param)
  an_array_param << 'rutabaga'
end

my_string = 'pumpkins'
my_array = ['pumpkins']
my_new_string = tricky_method(my_string)
my_new_array = tricky_method_two(my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
p my_new_array
p my_new_string
