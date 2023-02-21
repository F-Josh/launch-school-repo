def triangle(n)
  final_array = [] # This array will hold arrays which elements are odd numbers
  current_odd_number = 1
  element_tracker = 1 # This will keep track of the number of elements needed in current row
  loop do
    current_row_array = [] # This will hold the odd elements on each row of the triangle
    until current_row_array.size == element_tracker # Does this make it clearer?
      # The element_tracker determines how many odd element current_row_array should get in each iteration
      current_row_array << current_odd_number # keep pushing until the above condition is met
      current_odd_number += 2 # adding 2 to an odd number gives us the next oodd
    end
    element_tracker += 1 # You get the gist now? the next current_array/ triangle level should have +1 elements
    final_array << current_row_array # push to the final array
    break if final_array.size == n # keep going until we have n elements/levels in the final array
    # Recall that each element in the final array represents a level in the triangle
    #3 
  end
  final_array.last.sum #We simply call the Array#sum method on the last element of the final array
end

p triangle(5)
p triangle(50) # sum of line 50
p triangle(3) #  => 7 + 9 + 11 => 27