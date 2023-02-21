def palindrome?(word)
  word == word.reverse
end


# def real_palindrome?(word)
#   word = word.downcase.chars
#   alphabets = ('a'..'z').to_a
#   numbers = (0..9).to_a
#   word = word.select{|elem| alphabets.include?(elem) || numbers.include?(elem)}
#   p word
#   palindrome?(word)
# end

def real_palindrome?(word)
  words_array = word.downcase.chars
  ans = words_array.select{|elem| elem != " " && elem != ',' && elem != "'"}
  p ans
  palindrome?(ans)
end

# explore for the method to take an array 

p real_palindrome?('madam')
p real_palindrome?('Madam')          # (case does not matter)
p real_palindrome?("Madam, I'm Adam") # (only alphanumerics matter)
p real_palindrome?('356653')
p real_palindrome?('356a653') 
p real_palindrome?('123ab321')
p real_palindrome?('123ab321')