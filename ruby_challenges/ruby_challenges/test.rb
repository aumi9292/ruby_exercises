class Employee

  attr_accessor :salary 
  def initialize(name)
    @name = name 
    @salary = 10 
    @location = 'Denver'
  end 

end 

def update_data(select_string, block)
  #data = fetch(select_string)
  data = [Employee.new('Bob'), Employee.new('Jackie')]
  data.each(&block) # you can update or replace this line

  #save(data)
end

def update_by_type(type, &block) # you can update this method
  update_data("employee_type = #{type}", block)
end

def update_by_location(location, &block) # you can update this method
  update_data("employee_location = #{location}", block)
end

# Example calls - do not modify these lines
update_by_type("Manager") do |employee|
  employee.salary *= 1.25
end

update_by_location("Oregon") do |employee|
  employee.salary *= 1.10
end


# def update_data(select_string, block)
#   data = fetch(select_string)
#   data.each # you can update or replace this line
#   save(data)
# end

# def update_by_type(type, &update) # you can update this method
#   update_data("employee_type = #{type}")
# end

# def update_by_location(location, &update) # you can update this method
#   update_data("employee_location = #{location}")
# end

# # Example calls - do not modify these lines
# update_by_type("Manager") do |employee|
#   employee.salary *= 1.25
# end

# update_by_location("Oregon") do |employee|
#   employee.salary *= 1.10
# end
