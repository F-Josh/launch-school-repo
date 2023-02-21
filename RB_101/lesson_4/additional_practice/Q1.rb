=begin
Data Structures = hash
Algorithm
- Initialize an empty hash and name it flintstones_hash
 - Iterate through the array using Enumerable#each_with_index method
 - set the hash key to the elements, and values = index
 return the array
 - 
=end
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_hash = {}
flintstones.each_with_index do |element, index|
  flintstones_hash[element] = index
end
p flintstones_hash

