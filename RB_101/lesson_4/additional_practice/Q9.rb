# A method that has each word capitalized
def titleize(string)
  return "Wrong argument" if string.class != String
  split_word = string.split
  if split_word.size == 1
    return string.capitalize
  else
    split_word.map! {|word| word.capitalize}
  end
  split_word.join(' ')
end
words = "the flintstones rock"
p titleize(words)