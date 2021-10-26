contact_data = [["joe@email.com", "123 Main Street.", "555-123-4567"],
 ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

 contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

 contact_data.map do |item|
  contacts.each_key {|key, val| val.each {|item|}}
 
end 
p contacts