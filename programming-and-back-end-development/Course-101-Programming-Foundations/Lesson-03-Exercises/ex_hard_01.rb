# 1
# if false
#   greet = “hello world”
# end

# greeting
# it returns nil, since the greeting variable was initialied in the 
# if statement; had there been no if statement with the local variable greeting, 
# and greeting was called outside of it, it would have returned: 
# `<main>': undefined local variable or method `greeting' for main:Object (NameError)

# 2
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings
# greetings prints: {:a=>"hi there"}
# informal_greeting references the value associated with the key, greetings[:a]
# > informal_greeting.object_id
# => 70306014290860 
# > greetings[:a].object_id
# => 70306014290860
# both informal_greeting and greetings[:a] are two different names referencing 
# the same area in memory pointing to the value of "hi";
# the << was used, which modifies the original object, 
# informal_greeting << ' there'
# resulting in, {:a=>"hi there"}, as the output

# 3A
def mess_with_vars(one, two, three)
  one = two # "two"
  two = three # "three"
  three = one # "one"
end
# parameter values are kept within method

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
# => "one is: one"
puts "two is: #{two}"
# => "two is: two"
puts "three is: #{three}"
# => "three is: three"

# 3B
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)
# like prior exercise 3A, parameter values are kept within method

puts "one is: #{one}"
# => "one is: one"
puts "two is: #{two}"
# => "two is: two"
puts "three is: #{three}"
# => "three is: three"

# 3C
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)
# the gsub method is used along with the !, bang operator, 
# which mutates the object being called, in this case, each of the 
# variables: one, two, three, that were passed into the mess_with_vars
# method; the changes are reflected in the output below

puts "one is: #{one}"
# => "one is: two"
puts "two is: #{two}"
# => "two is: three"
puts "three is: #{three}"
# => "three is: one"

# 4
# WORK IN PROGRESS

# 5
# def dot_separated_ip_address?(input_string)
#   dot_separated_words = input_string.split(".")

#   while dot_separated_words.size > 0 do
#     word = dot_separated_words.pop
#     break if !is_a_number?(word)
#   end
#   return true
# end

# p dot_separated_ip_address?("12431.31231.1231.1231")

# is_a_number?
# determine if an input string is an IP address representing dot-separated numbers, 
# e.g. "10.4.5.11"

# 1) not returning a false condition
# 2) not handling the case that there are more or fewer than 4 components to the 
# IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_a_number?(word)
  end

  true
end
