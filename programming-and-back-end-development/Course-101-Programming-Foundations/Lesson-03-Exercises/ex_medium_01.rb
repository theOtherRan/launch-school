# 1
10.times { |i| puts (" " * i) + "The Flintstones Rock!" }

# 2
statement = "The Flintstones Rock"
statement_letters = statement.delete(" ").split("").sort

statement_hash = {}

statement_letters.each_with_index do |letter, idx|
  statement_hash[letter] = statement.count(letter)
end

p statement_hash

# 3
# puts "the value of 40 + 2 is " + (40 * 2)

puts "the value of 40 + 2 is #{40 + 2}" # use string interpolation
puts "the value of 40 + 2 is " + (40 + 2).to_s # use the to_s method (to_string)

# 4
numbers = [1,2,3,4]
# numbers.each do |number|
#   p number
#   numbers.shift(1)
# end

numbers.each_with_index do |number, idx|
  p "#{idx} #{numbers.inspect} #{number}"
  numbers.shift(1)
end
# it will first print out the number in the current index, being 1,
# then the unshift method will remove one element in the beginning 
# of the numbers array, again 1; the array will be numbers = [2, 3, 4]
# in the next iteration, since the index is at 1,ie. numbers[1], 
# it will print out 3, then again, remove one element from the 
# beginning of the numbers array; the array will be numbers = [3, 4]
# since the next iteration will at index 2,ie. numbers[2], 
# and the numbers array no longer has a value at that index, 
# the iteration will stop

numbers = [1,2,3,4]
# numbers.each do |number|
#   p number
#   numbers.pop(1)
# end

numbers = [1,2,3,4]
numbers.each_with_index do |number, idx|
  p "#{idx} #{numbers.inspect} #{number}"
  numbers.pop(1)
end
# like the prior example, but the pop method starts the process from 
# the end of the array: 
# 0 [1,2,3,4] 1
# 1 [1,2,3] 2
# 2 [1,2] iteration ends because no value at index 2

# 5
def factors(number)
  dividend = number
  divisors = []

  if dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
  divisors
end

p factors(10)
# number % dividend == 0, makes sure that there is no remainder after 
# division of the number by another number; when the condition is met, 
# it is added to the divisors array, to indicate all the factors of 
# the number provided in the argument of the factors method

# placing divisors after the if statement, returns the array of all 
# values that met the condition, in this case, all the factors of the 
# number provided in the argument of the factors method

# 6
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end
# Both methods have the same return value, but 
# rolling_buffer1 uses the "<<" shovel operator, which modifies the 
# original buffer
# rolling_buffer2 makes uses of concatenation, which does not alter the 
# original buffer

# 7
# limit = 15

# def fib(first_num, second_num) # def fib(first_num, second_num, limit)
#   while second_num < limit
#     sum = first_num + second_num
#     first_num = second_num
#     second_num = sum
#   end
#   sum
# end

# result = fib(0, 1) # result = fib(0,1,limit)
# puts "result is #{result}"
# the error deals with scope and methods
# since the limit variable was not passed into the method, 
# the fib method is not able to access it and its value; 
# to fix this, include the limit variable in the argument of 
# the fib method, which will then be passed to the parameter 
# and be accessible for use in the method

# 8
def titleize(string)
  string.split(" ").map { |word| word.capitalize }.join(" ")
end

p titleize("hello world!")

# 9
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key, value|
  case value["age"]
  when (0..17)
    value.merge!({"age group" => "kid"})
  when (18..64)
    value.merge!({"age group" => "adult"})
  else
    value.merge!({"age group" => "senior"})
  end
end

p munsters
