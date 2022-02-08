
def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end
ans = nil
loop do
  puts"Please enter a numerator:"
  numerator = gets.chomp
  next puts "Invalid input, only Integers are allowed" if valid_number?(numerator) == false
  puts "Please enter a denominator:"
  denominator = gets.chomp
  next puts  puts "Invalid input, a denominator of 0 is not allowed" if  denominator.to_i == 0
  if valid_number?(numerator) == true && valid_number?(denominator) == true
    ans = numerator.to_i / denominator.to_i
    break
  end 
end 

puts ans