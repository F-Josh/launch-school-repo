def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

num1 =  nil
num2 = nil
loop do
  puts "Please enter a positive or a negative integer:"
  num1 = gets.chomp
  puts "Please enter a positive or a negative integer"
  num2 = gets.chomp
  next puts "Invalid output, only non-zero integers are allowed" if(num1 == '0') || (num2 == '0')
  break if (valid_number?(num1)) && (valid_number?(num2)) && 
  (num1.to_i < 0 && num2.to_i > 0) || (num2.to_i < 0 && num1.to_i > 0)
  puts "Invalid input. Only non-zero itegers are allowed"
end 
puts num1.to_i + num2.to_i


