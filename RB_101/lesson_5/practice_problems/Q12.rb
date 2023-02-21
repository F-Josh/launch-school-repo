arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]


newh = arr.each_with_object({}) do |sub_array, new_hash|
  new_hash[sub_array[0]] = sub_array[1]
end
p newh







# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}