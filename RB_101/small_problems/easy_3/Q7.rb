=begin
PEDAC PROCESS
P - Understanding the problem
  - The method takes an array as input
  - Output - returns an array with every other element= in the array

  Questions:
  - Is an empty array valid??
  - Do we need to validate input?

  Implicit
    - An empty array returns an empty array
  Explicit 
  - The values in the returned array should start from the index 0, then every 
  - Other element

E - Examples:
  oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
  oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
  oddities(['abc', 'def']) == ['abc']
  oddities([123]) == [123]
  oddities([]) == []

D - Data structures 
  - An array for holding the result and will be returned

A - Algorithm
    - Define your method to accept an array parameter
    - Validata the input if needed
    - Create  a new empty array for storing result
    - Return the empty array of the array is empty
    - Else, iterate over the elements of the array using the index, keep track 
    - Of the index starting from 0, push arr[index] , and incremen index by 2
    - Retrun  the new array

C - Code with intent - Consider the language limitations here
=end

def oddities(arr)
  return "Valid input, please enter an array" if arr.class != Array
  odd_elements = []
  return odd_elements if arr.empty?
  arr.each_index do |idx|
    odd_elements << arr[idx] if idx.even?
  end
  odd_elements
end

def evenly(arr)
  even_elements = []
  return even_elements if arr.empty?
  idx = 1
  while idx < arr.size
    even_elements << arr[idx]
    idx += 2
  end
  even_elements
end 

p evenly([2, 3, 4, 5, 6]) 
p oddities([1, 2, 3, 4, 5, 6]) 
p oddities(['abc', 'def'])
p oddities([123])
p oddities([])
