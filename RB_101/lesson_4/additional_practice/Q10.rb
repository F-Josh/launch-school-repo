
# Get the values of the hashes which is also a hash
# Iterate over the array of hashes to get the keys and values
# compare the ages and add a new entry to the hash based 
# Get the age variable, and use range to determine the category
# Then manipulate the the values hash
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters_array = munsters.values
munsters_array.each do |pair|
  age = pair.values[0]
  case age
  when 0..17
    pair["age_group"] = "kid"
  when 18..64
    pair["age_group"] = "adult"
  else
    pair["age_group"] = "senior"
  end
end
p munsters

