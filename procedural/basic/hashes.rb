my_hash = {name: "Austin", age: 28, savings: 15000, partner: true, job: false, home_value: 175000}

my_hash.each {|key, value| puts "Austin's #{key} is #{value}"}

def greeting(name, options = {})
if options.empty? 
  puts "Hi, my name is #{name}"
else
  puts "Hi, my name is #{name} and I'm #{options[:age]} years old and I live in #{options[:city]}."
end 
end 

  greeting("Austin", {city: "Denver", age: 28})

  puts my_hash.has_key?(:partner)
  puts my_hash.values[-1]

  family = {
    uncles: ["bob", "joe", "steve"], 
    sisters: ["jane", "jill", "beth"], 
    brothers: ["frank", "rob", "david"], 
    aunts: ["mary", "sally", "susan"]
  }

  siblings = family.select do |k, v| k == :sisters || k == :brothers
  end 

  p siblings.values.flatten

  merged = my_hash.merge(family)

  p merged

  family.merge!({parents: ["mom", "dad"]})

  puts family

  family.each {|k, v| puts "My #{k} are #{v}."}

  puts family.values.flatten.include?("dad")

  words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']


result = {}
anograms = []
words.each do |word|
  alphabetized = word.split("").sort.join("")
  result.has_key?(alphabetized) ? result[alphabetized] << word : result[alphabetized] = Array.new(1, word)    
end 

p result.values


# def anograms(array)
#   sorted = []
#   final = []
#   ano_indexes = []
#   sorted_hash = Hash.new(ano_indexes)

#   array.each do |el|
#   sorted << el.split("").sort.join("")
#   end 
#   sorted.each_with_index do |el, i|
#     sorted_hash[el] 
#     ano_indexes << i 
#   end 
#   sorted_hash
# end 

# puts anograms(words)

# puts words.each do |el| 
#    new_words.select {|sorted| sorted == el.split("").sort.join("")}
# end 

# def anogram_groups(array)
#   new_words = []
#   count_hash = {}
#   final = []

#   array.uniq.each do |el| 
#     new_words << el.split("").sort.join("") 
#   end
# final_sets = []
#   new_words.each do |sorted|
#     array.uniq.each_with_index do |word, index| 
#       if word.split("").sort.join("") == sorted
#         final_sets << array[index]
#         final << final_sets
#       end 
#     end 
#   end 
#   final 
# end 
 

# p anogram_groups(words)

# ans = ["bob", "bbo", "ass", "sas", "bas"]
# def compare_letters(array)
#   compare_array = []
#   count_hash = {}
#   array.each do |word|
#     count_hash[word.split("").sort.join("")] = 0 
#   end 
# count_hash


# end 

# puts compare_letters(ans)
