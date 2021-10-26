def increment(arr)
  res = []
  arr.each do |item|
    res.push(item + 2)
  end
  return res
end 
arr = [1, 2, 3, 4, 5]
p increment(arr)
p arr