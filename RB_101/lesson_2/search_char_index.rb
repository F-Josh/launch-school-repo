# Problem solving
# A method that determines the index of the 3rd occurrence of a
# given character in a string.
# For instance, if the given character is 'x' and the string is 'axbxcdxex'
# the method should return 6 (the index of the 3rd 'x').
# If the given character does not occur at least 3 times, return nil.
# Pseudocode
# START the program by welcoming the user
# DEFINE your method with the needed parameters (String, char)
# SET  variable counter = 0
# SET  variable len = 0
# ITERATE over the string using the String#each_char method with a block
# And parameter, Item
# IF Item == char(char_to_search) counter += 1
# RETURN the index of char if counter == 3 using the String#index
# method with an offset
# The offset we will use is len, i.e searching starting from len
# len += 1 after each iteration
# Return nill otherwise
def get_index(str, char)
  counter = 0
  len = 0
  str.each_char do |item|
    
    counter += 1 if item == char
    return str.index(item, len) if counter == 3
    len += 1

  end
  nil
end
p get_index("axbcdxxex", "x")
