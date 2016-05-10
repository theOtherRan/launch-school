# 1
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
# flintstones[0..5] # shorthand version of array

# 2
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push("Dino") # adds "Dino" to end of array
flintstones << "Dino" # another method of adding "Dino" to array

# 3
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push("Dino", "Hoppy") # adds both items in parameter to array
# returns ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles", "Dino", "Hoppy"]

# 4
advice = "Few things in life are as important as house training your pet dinosaur."

advice.slice!("Few things in life are as important as ")
# returns "Few things in life are as important as "
# advice variable mutated to "house training your pet dinosaur."

# 5
statement = "The Flintstones Rock!"
statement.scan("t").count # returns 2

# 6
title = "Flintstone Family Members"

linewidth = 40
p title.center(linewidth)
# centers title in 40 character wide table
