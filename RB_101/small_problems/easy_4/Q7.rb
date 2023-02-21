



def running_total(arr)
  return [] if arr.empty?
  ans = []
  ans << arr[0]
  running_sum = arr[0]
  arr.each_with_index do |elem, index|
    if index > 0
      running_sum += elem
      ans << running_sum
    end
  end
  ans
end


def running_sum(array)
  sum = 0
  array.each_with_object([]) do |elem, arr|
    arr << sum += elem
  end
end

def running_sum2(arr)
  ans = []
  arr.inject(0) do |total, elem|
    ans << total += elem
    total
    # you can also ans[ans.length] = total += elem so you can return total during next iteration
  end
  ans
end

# explore
def running_total(arr)
  arr.inject([]) { |new_arr, num| new_arr << new_arr.sum + num }
end



# p running_sum2([2, 5, 13])
# p running_sum2([14, 11, 7, 15, 20])
# p running_sum2([3])
# p running_sum2([])

=begin
# Study recursive solution
def running_total(arr)
  return [] if arr.empty?

  running_total(arr[0..-2]) + [arr.sum]
end
=end

def run_total(arr)
  ans = []
  arr.reduce(0) do |total, elem|
    #total += elem
    p ans[ans.length] = total += elem
  end
  ans
end
p run_total([2, 5, 13])
