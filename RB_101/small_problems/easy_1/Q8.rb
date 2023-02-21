=begin
PEDAC
PEDA
  Inputs - 1 argument - 1 argument, an array of integers
  Outputs -  Return an average of all numbers
  Problem domain-  An integer is a whole number and can be positive or negative
  Explicit /Implicit - The array will never be empty, numbers will always be +
  - Result should be an integer

  Questions- 

  Example:
    puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
    puts average([1, 5, 87, 45, 8, 8]) == 25
    puts average([9, 47, 23, 95, 16, 52]) == 40

  DS- 

  Algorithm:
    - Initialize a sum variable for holding the total sum
    - Initialize a num variable for holding the size of array
    - Use the each method to add the sum to array element
    - Return sum/ num 

Code with intent 
=end

def average(arr_num)
  puts "Wrong argument(enter an arrayof intergers)" if arr_num.class != Array
  sum = 0.0
  num_of_elements = arr_num.size
  arr_num.each { |elem| sum += elem}
  average_num = sum / num_of_elements
end

puts average([1, 6])  # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) 
puts average([9, 47, 23, 95, 16, 52])