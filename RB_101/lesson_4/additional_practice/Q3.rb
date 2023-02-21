=begin
Algorithm 
 - Iterate over the hash and use Hash#keep_if method or select!
 to keep the values you want. 
=end

ages = { "Herman" => 32, "Lilly" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages.each do |key, val|
  ages[key] = val if val < 100
end
ages.keep_if {|_, value| value <  100}
p ages
