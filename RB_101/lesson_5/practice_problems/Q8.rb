
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each_value do |value|
  words = value.join
  words.length.times do |word|
    if ['a', 'e', 'i', 'o', 'u'].include?(words[word])
      puts words[word]
    end
  end
end

arr  = hsh.values.flatten
arr.each do |elem|
  elem.chars do |char|
    p char if ['a', 'e', 'i', 'o', 'u'].include?(char)
  end
end
