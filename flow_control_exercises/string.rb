def change_to_caps(word)
  if word. length > 10
    return word.upcase
  else
    return word
  end
end
puts change_to_caps("obinna")