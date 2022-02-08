
def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end
loop do 
  puts ">> How many output lines do you want? Enter a number >= 3 (Q to quit):"
  input = gets.chomp
  break if input == 'Q' || input == 'q'
  if valid_number?(input) && input.to_i >= 3
    input.to_i.times { puts "LaunchSchool is the best!"} 
  else
    puts "That is is not enough lines"
  end 
end 

  

