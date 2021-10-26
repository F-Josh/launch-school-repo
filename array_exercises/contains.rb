def check(arr, num)
  arr.include?(num)
end
arr = [1, 3, 5, 7, 9, 11]
num = 3
puts check(arr, num)