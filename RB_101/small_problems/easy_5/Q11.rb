
def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

=begin
  - `Array#join` will always return a new string object - See Easy 5 Q11
- Once we have converted  a `string` into an array by calling the `split` 
method on it, It is no longer possible for us to get back the original object
 again.
- However, as soon as we have converted string into an array by calling `split`
 method on it, it is no longer possible for us to get back the original object
 again. Even just doing `str.split.join(" ")`returns a different object 
 since you are splitting the string into an array and then joining that 
 array back into a new string, with the same sequence of characters but still,
  a different object.
=end
