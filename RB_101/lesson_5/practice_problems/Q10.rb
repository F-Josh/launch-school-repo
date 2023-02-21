# input = An array of hashes
# Return a new array of hashes, where value of each integer is incremented by 1
# Iterate over the array using map method
# Iterate over the array element which is a hash and oncrement value by 1
# Do not modify the origianl array

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]


#new_hash = {}

new_arr = arr.map do |element|
  element.each_with_object({}) do |(key,val), new_hash|
    new_hash[key] = val +  1
  end
end
p new_arr
p arr

