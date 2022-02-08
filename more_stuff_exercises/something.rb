
while true 
  puts ">> Do you want to print something? (y/n)"
  input = gets.chomp.downcase
  if(input != 'y') && ( input != 'n')
    puts "invalid input! please enter y or n"
  end 
  break puts "print something" if input == 'y'
  break if input == 'n'
end 


