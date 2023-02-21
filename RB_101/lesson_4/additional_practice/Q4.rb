=begin
Algorithm 
 - Returns all the values into an array, and iterate over all the element
=end
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

minimum = ages["Herman"]
ages.each do |_, value|
  if value < minimum
    minimum = value
  end
end
p minimum