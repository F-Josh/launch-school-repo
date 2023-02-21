=begin
Algorithm 
 - We simply need to get the ages from all the members and add them up
 - Since the ages are all of the hash values, use hash.values 
 - to get the ages into a hash, them sum them using the reduce or
 - Inject method, sum or simply loop to add up thier values
=end

ages = { "Herman" => 32, "Lilly" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages_array = ages.values
sum = ages_array.reduce(:+)
p ages_array
p sum