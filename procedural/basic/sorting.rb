arr = [1, 4, 7, 10, 19, 2, 30, 100]

p arr.sort
p arr.sort { |a, b| b <=> a }

names = ['Austin Miller', 'Celia Witz', 'Bojack Horseman', 'B Obama']

last_names = names.sort_by do |el|
  el.split.last
end

p last_names

people = { Kate: 27, john: 25, Mike: 18 }
p people.sort_by { |k, _v| k.downcase }
p arr.minmax
