
arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

ans = arr.sort_by do |sub_array|
  sub_array.select {|num| num % 2 == 1}
end 
p ans