# Input - Nested array
# Output - new array identical to the original
# Output array should ony contain intergers that are multiple of 3

# Algorithm
# - Iterate through the outer array using map
# - Iterate over the inner array elements using select which returns a new array
# - Return the variable ans
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

ans = arr.map do |sub_array|
  sub_array.select { |element| element % 3 == 0}
end
p ans
