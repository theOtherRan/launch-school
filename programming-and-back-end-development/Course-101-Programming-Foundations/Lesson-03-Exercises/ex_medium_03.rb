# 1, comments added to break down each value of a,b,c,d as an integer, string, array, and array index number holding a value
def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id # returns 85
  b_outer_id = b_outer.object_id # returns 70205691182020
  c_outer_id = c_outer.object_id # returns 70205691182000
  d_outer_id = d_outer.object_id # returns 85, same as a_outer_id, since c_outer[0] returns a value of 42;
  # therefore, d_outer points to the same area in memory as a_outer
  # additionally, unlike c_outer = [42], d_outer does not take on an index value-element pair like an array,
  # just the value of: 42

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  # => "a_outer is 42 with an id of: 85 before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  # => "b_outer is forty two with an id of: 70205691182020 before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  # => "c_outer is [42] with an id of: 70205691182000 before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block.\n\n"
  # => "d_outer is 42 with an id of: 85 before the block."

  1.times do
    a_outer_inner_id = a_outer.object_id # returns 85
    b_outer_inner_id = b_outer.object_id # returns 70205691182020
    c_outer_inner_id = c_outer.object_id # returns 70205691182000
    d_outer_inner_id = d_outer.object_id # returns 85

    puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer_inner_id} inside the block."
    # => "a_outer id was 85 before the block and is: 85 inside the block.""
    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block."
    # => "b_outer id was 70205691182020 before the block and is: 70205691182020 inside the block."
    puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer_inner_id} inside the block."
    # => "c_outer id was 70205691182000 before the block and is: 70205691182000 inside the block."
    puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer_inner_id} inside the block.\n\n"
    # => "d_outer id was 85 before the block and is: 85 inside the block."

    a_outer = 22 # a_outer reassigned the value 22 inside the times method block; new object_id assigned as well
    # > a_outer.object_id, returns 45
    b_outer = "thirty three" # b_outer reassigned the value "thirty three" inside the times method block; 
    # new object_id assigned as well: b_outer.object_id, returns 70205691181300
    c_outer = [44] # c_outer reassigned the value [44] inside the times method block; 
    # new object_id assigned as well: c_outer.object_id, returns 70205691181280
    d_outer = c_outer[0] # d_outer ressigned the value of 44 inside the times method block;
    # new object_id assigned as well: d_outer.object_id, returns 89

    puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
    # => "a_outer inside after reassignment is 22 with an id of: 85 before and: 45 after."
    puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
    # => "b_outer inside after reassignment is thirty three with an id of: 70205691182020 before and: 70205691181300 after."
    puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
    # => "c_outer inside after reassignment is [44] with an id of: 70205691182000 before and: 70205691181280 after."
    puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after.\n\n"
    # +> "d_outer inside after reassignment is 44 with an id of: 85 before and: 89 after."

    a_inner = a_outer # assign variable a_outer, value of 22, to new variable a_inner within times method block
    b_inner = b_outer # assign variable b_outer, value of "thirty three", to new variable b_inner within times method block
    c_inner = c_outer # assign variable c_outer, value of [44], to new variable c_inner within times method block
    d_inner = c_inner[0] # assign variable d_outer, value of 44, to new variable d_inner within times method block

    a_inner_id = a_inner.object_id # a_inner_id takes on same object_id as a_outer, 45, since a_inner = a_outer 
    b_inner_id = b_inner.object_id # b_inner_id takes on same object_id as b_outer, 70205691181300, since b_inner = b_outer 
    c_inner_id = c_inner.object_id # c_inner_id takes on same object_id as c_outer, 70205691181280, since c_inner = c_outer 
    d_inner_id = d_inner.object_id # d_inner_id takes on same object_id as d_outer, 89, since d_inner = c_inner[0]

    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)."
    # => "a_inner is 22 with an id of: 45 inside the block (compared to 45 for outer)."
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)."
    # => "b_inner is thirty three with an id of: 70205691181300 inside the block (compared to 70205691181300 for outer)."
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)."
    # => "c_inner is [44] with an id of: 70205691181280 inside the block (compared to 70205691181280 for outer)."
    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer).\n\n"
    # => "d_inner is 44 with an id of: 89 inside the block (compared to 89 for outer)."
  end

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block."
  # outside of times method code block, back within fun_with_ids method scope
  # => "a_outer is 22 with an id of: 85 BEFORE and: 45 AFTER the block."
  # a_outer and a_outer.object_id takes on new value from within times method, since it was declared outside of it
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block."
  # => "b_outer is thirty three with an id of: 70205691182020 BEFORE and: 70205691181300 AFTER the block."
  # b_outer and b_outer.object_id takes on new value from within times method, since it was declared outside of it
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block."
  # =>"c_outer is [44] with an id of: 70205691182000 BEFORE and: 70205691181280 AFTER the block."
  # c_outer and c_outer.object_id takes on new value from within times method, since it was declared outside of it
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block.\n\n"
  # => "d_outer is 44 with an id of: 85 BEFORE and: 89 AFTER the block."
  # d_outer and d_outer.object_id takes on new value from within times method, since it was declared outside of it

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  # outputs "ugh ohhhhh", due to error from the scope of a_inner and a_inner.object_id variables being within the times method
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  # outputs "ugh ohhhhh", due to error from the scope of b_inner and b_inner.object_id variables being within the times method
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  # outputs "ugh ohhhhh", due to error from the scope of c_inner and c_inner.object_id variables being within the times method
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block.\n\n" rescue puts "ugh ohhhhh"
  # outputs "ugh ohhhhh", due to error from the scope of d_inner and d_inner.object_id variables being within the times method
end

# 2, comments added to break down each value of a as an integer
# main difference between exercise 1 and 2, is the values of the variables declared outside the method, that were 
# reassigned new values within the method, did not carry over outside of the method, due to scope;
# the values can be accessed outside of the method, if return is stated explicitly
# assign value from within method to the variable:
# a_outer = an_illustrative_method(a_outer)
# explicitly call a return from within the method:
# def an_illustrative_method(a_outer)
# / code block /
# return a_outer
# end
def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id # returns 85
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id # returns 85

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  # => "a_outer is 42 with an id of: 85 before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block.\n\n"

  an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)


  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the method call."
  # => "a_outer is 42 with an id of: 85 BEFORE and: 85 AFTER the method call."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the method call."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the method call."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the method call.\n\n"

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  # outputs "ugh ohhhhh", due to error from the scope of a_inner and a_inner.object_id variables being within the times method
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the method.\n\n" rescue puts "ugh ohhhhh"
end


def an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)
  a_outer_inner_id = a_outer.object_id # returns 85
  b_outer_inner_id = b_outer.object_id
  c_outer_inner_id = c_outer.object_id
  d_outer_inner_id = d_outer.object_id

  puts "a_outer id was #{a_outer_id} before the method and is: #{a_outer.object_id} inside the method."
  # => "a_outer id was 85 before the method and is: 85 inside the method."
  puts "b_outer id was #{b_outer_id} before the method and is: #{b_outer.object_id} inside the method."
  puts "c_outer id was #{c_outer_id} before the method and is: #{c_outer.object_id} inside the method."
  puts "d_outer id was #{d_outer_id} before the method and is: #{d_outer.object_id} inside the method.\n\n"

  a_outer = 22 # a_outer reassigned the value 22 inside the method; new object_id assigned as well
  # => a_outer.object_id, returns 45
  b_outer = "thirty three"
  c_outer = [44]
  d_outer = c_outer[0]

  puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
  # => "a_outer inside after reassignment is 22 with an id of: 85 before and: 45 after."
  puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
  puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
  puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after.\n\n"


  a_inner = a_outer # assign variable a_outer, value of 22, to new variable a_inner within method
  b_inner = b_outer 
  c_inner = c_outer
  d_inner = c_inner[0]

  a_inner_id = a_inner.object_id # a_inner_id takes on same object_id as a_outer, 45, since a_inner = a_outer 
  b_inner_id = b_inner.object_id
  c_inner_id = c_inner.object_id
  d_inner_id = d_inner.object_id

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the method (compared to #{a_outer.object_id} for outer)."
  # => "a_inner is 22 with an id of: 45 inside the method (compared to 45 for outer)."
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the method (compared to #{b_outer.object_id} for outer)."
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the method (compared to #{c_outer.object_id} for outer)."
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the method (compared to #{d_outer.object_id} for outer).\n\n"
end

# 3
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
# "My string looks like this now: pumpkins"
# the a_string_param and its value are reassigned from within the tricky method
# but, it is not accessible outside of it, unless explicitly stated so
puts "My array looks like this now: #{my_array}"
# "My array looks like this now: ["pumpkins", "rutabaga"]"
# the << shovel operator is a destructive method, and any changes are 
# reflected outside of the tricky_method

# 4
def tricky_method_two(a_string_param, an_array_param)
  a_string_param.gsub!('pumpkins', 'rutabaga')
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
# "My string looks like this now: rutabaga"
# the gsub method along with the !, bang operator, mutates the string 
# object, and its changes are carried over outside tricky_method_two
puts "My array looks like this now: #{my_array}"
# "My array looks like this now: ["pumpkins"]"
# the an_array_param is reassigned a new value, but its changes are within 
# the scope of the tricky_method_two

# 5
def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

# original 
def color_valid(color)
  return true if color == "blue" || color == "green"
end

# refactored, since if method condition passes, it returns true without having to state it explicitly
def color_valid(color)
  return true if color == "blue" || color == "green"
end
