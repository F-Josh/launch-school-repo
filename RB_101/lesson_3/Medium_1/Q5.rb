limit = 5

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end 

result = fib(0, 1, limit)
puts "result is #{result}"


def fib2(num)
  if num == 0 || num == 1
    return num
  else
    fib2(num - 1) + fib2(num - 2)
  end
end
p fib2(10)