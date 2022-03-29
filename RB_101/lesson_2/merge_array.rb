
# A method that takes two arrays of numbers and returns the result of merging the arrays. 
# The elements of the first array should become the elements at the even indexes of the returned array,
# while the elements of the second array should become the elements at the odd indexes. For instance:
# merge([1, 2, 3], [4, 5, 6]) # => [1, 4, 2, 5, 3, 6]

# Pseudocode
# Start the program by welcoming the user
# Define your method and add your parameters, it will receive 2 arrays 
# SET an empty array, merged_array that will hold the elements from both array parameters with above condition
# SET a counter = 0 variable for determining where to place elements from array into the merged_array
# Iterate over each array passed as argument using the Array#each method and use Array#shift
# Array#[] to play elements into the merged array using counter as arguement,
# Increment counter  by 2 to get even index
# Repeat same while iterating over the second array element
# REset counter to start from 1 , and increment countr by 2 also 
# Return the merged array

def get_merged_array(arr1, arr2)
  merged_array = []
  counter = 0
  arr1.each do |elem|
    p arr1 #for debugging
    merged_array[counter] =  elem
    p arr1 #for debugging
    counter += 2
  end 
  
  counter = 1
  arr2.each do |elem|
    p arr2 #for debugging
    merged_array[counter] =  elem
    p arr2 #for debugging
    counter += 2
  end 

  merged_array
end 

p get_merged_array([1, 2, 3], [4, 5, 6]) 
# result  => [1, nil, 2] instead of [1, nil, 2, nil, 3]

