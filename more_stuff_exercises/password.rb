
user = "obiJ"
pass = "JESUSBOY"
loop do
  puts "Please enter your username:"
  username = gets.chomp
  puts "Please enter your password:"
  password = gets.chomp
  
  break if (username == user) && (password == pass)
  puts "Authrozation failed!"
end 
puts "Welcome!"
