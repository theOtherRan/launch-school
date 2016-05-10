# 1
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.has_key?("Spot") # returns false
ages.fetch("Spot", "Spot is not on the list")
# returns "Spot is not on the list"

# 2
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

sum = 0
ages.each do |name, age|
  sum += age
end
# returns 6174

# 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.delete_if {|name, age| age >= 100}
# returns {"Herman"=>32, "Lily"=>30, "Eddie"=>10}

# 4
munsters_description = "The Munsters are creepy in a good way."

munsters_description.capitalize! # returns "The munsters are creepy in a good way."
munsters_description.swapcase! # returns "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description.downcase! # "the munsters are creepy in a good way."
munsters_description.upcase! # "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

# 5
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages = ages.merge(additional_ages)
#  returns {"Herman"=>32, "Lily"=>30, "Grandpa"=>5843, "Eddie"=>10, "Marilyn"=>22, "Spot"=>237} 

# 6
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.values.min # returns minimum age of Munster family hash

# 7
advice = "Few things in life are as important as house training your pet dinosaur."
advice.include?("Dino") # returns false

# 8
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.index { |flintstone| flintstone[0..1] == "Be" }
# returns index number 3

# 9
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! do |flintstone|
  flintstone.slice(0,3)
end
# returns ["Fre", "Bar", "Wil", "Bet", "Bam", "Peb"] 

# 10
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |flintstone| flintstone.slice(0,3) }
# returns ["Fre", "Bar", "Wil", "Bet", "Bam", "Peb"] 
