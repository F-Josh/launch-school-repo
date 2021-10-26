contact_data = [["joe@email.com", "123 Main Street.", "555-123-4567"],
 ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

 contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

 def arr_has(arr, hsh)
  arr.each do |elem|
    hsh.each do |k, v|
      hsh[k] = elem
    end
  end
end

arr_has(contact_data, contacts)
    