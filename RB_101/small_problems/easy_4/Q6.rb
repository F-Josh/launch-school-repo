def mulsum(num)
  sum = 0
  1.upto(num) do |elem|
    if elem % 3 == 0 || elem % 5 == 0
      sum += elem
    end
  end
  sum
end

def mulsum2(num)
  sum = 0
  start = 1
  loop do
    break if start > num
    sum += start if start % 3 == 0 || start % 5 == 0
    start += 1
  end
  sum
end

def mulsum3(num)
  arr = (1..num).to_a
  arr.inject(0) do |total, elem|
    if elem % 3 == 0 || elem % 5 == 0
      total + elem
    else
      total
    end
  end
end

def multisum(num)
  initial_range = (1..num).to_a
  initial_range = initial_range.select do |x|
    x % 3 == 0 || x % 5 == 0
  end
  initial_range.sum
end

p mulsum3(1000)