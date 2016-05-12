# 1
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

sum = 0

munsters.each do |key, value|
  if value["gender"] == "male"
    sum += value["age"]
  end
end

# 2
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each_pair do |name, details|
  p "#{name} is a #{details["age"]} year old #{details["gender"]}."
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
puts "My array looks like this now: #{my_array}"

def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# in the tricky method, the output is not saved
# the my_string variable is passed to it 
# even though, the a_string_param is reassigned a different value 
# with +=, and a new object is assigned to it; the += does not modify 
# the original object, my_string
# my_array is passed to it
# the an_array_param is altered with << and it mutates the original 
# object, my_array
# in the not_so_tricky_method, the code is explicit on what is being 
# returned, with the line: return a_string_param, an_array_param
# the new objects created in the method are return and set with 
# my_string, my_array = not_so_tricky_method(my_string, my_array)
# which reassigns the values for my_string and my_array

# 4
sentence = "Humpty Dumpty sat on a wall."
sentence_arr = sentence.split("").reverse 
# returns [".", "l", "l", "a", "w", " ", "a", " ", 
# "n", "o", " ", "t", "a", "s", " ", "y", "t", "p", 
# "m", "u", "D", " ", "y", "t", "p", "m", "u", "H"] 
reverse_sentence = sentence_arr.join("")
# resulting in: ".llaw a no tas ytpmuD ytpmuH"

# 5
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8 # the output is: 34, due to this line of code
# the method does not call for the return value to be printed out

# 6
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

p mess_with_demographics(munsters)
# the method, mess_with_demographics, alters the munsters hash 
# because when working with hashes, the value of the parameter 
# is not being passed, rather the value stored in the object id;
# this will alter the same object, munsters hash, both inside 
# and outside of the method

# 7
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
# the method calls start from the center
# rps(rps("rock", "paper"), rps("rock", "scissors"))
# rps(rps("paper", "rock")), "rock")
# rps("paper", "rock")
# returns "paper"

# 8
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

bar(foo)
# the output of the code will be: "no"
# the foo method returns "yes", it is then passed to the bar method
# since the foo method returns "yes", the code block 
# param == "no" ? "yes" : "no"
# will result in the bar method returning "no"
