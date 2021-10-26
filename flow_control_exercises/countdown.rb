puts "Give me a number"
number = gets.chomp.to_i

while number >= 0
  puts number
  number = number - 1
end

puts "Done!"