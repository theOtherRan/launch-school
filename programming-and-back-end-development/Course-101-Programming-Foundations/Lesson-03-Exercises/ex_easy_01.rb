# 1
numbers = [1,2,3,3]
numbers.uniq

puts numbers 
# prints out each element of the numbers array on a new line
# the uniq method does not modify the original numbers object

# 2
# != is used to indicate 'not equal to'
# 1 != 2 returns true
# putting ! before something returns the opposite boolean value of the object
# !nil returns true
# putting ! after something, like a method, uniq! makes it destructive and 
# modifies the original object
# putting ? before something, is used in a ternary operator
# putting ? after something, like a method, returns a boolean value
# 1.is_even? returns false
# putting !! before something, returns the boolean value of the object
# !!nil returns false

# 3
advice = "Few things in life are as important as house training your pet dinosaur."

advice.gsub!("important", "urgent")

# 4
numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1) # deletes the element at index[1]: 2
# returns [1,3,4,5]
numbers.delete(1) # delete all instances of the element 1 from the numbers array
# returns [2,3,4,5]

# 5
p "42 is between 10 and 100" if 42.between?(10, 100)

# 6
famous_words = " seven years ago..."
other_famous_words = "Four score and"

famous_quote = "#{other_famous_words}#{famous_words}"
other_famous_words = other_famous_words + famous_words

# 7
def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep
# solution returns 42

# 8
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
# returns ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

flintstones.flatten! # to return an un-nested array

# 9
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones.assoc("Barney") # returns ["Barney", 2] 

# 10
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones = Hash[flintstones.each_with_index.map { |name, idx| [name, idx] }]
# returns {"Fred"=>0, "Barney"=>1, "Wilma"=>2, "Betty"=>3, "Pebbles"=>4, "BamBam"=>5}
