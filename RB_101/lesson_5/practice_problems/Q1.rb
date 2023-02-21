

arr = ['10', '11', '9', '7', '8']

ans = arr.sort_by do |item|
  item.to_i
end.reverse

p ans
