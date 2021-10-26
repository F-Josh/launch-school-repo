
def has_lab?(string)
  if string =~ /lab/
    puts "Yes we have a match for " + string + "!"
  else
    puts "No we d not have  a match for " + string
  end 
end 
has_lab?("laboratory")
has_lab?("experiment")
has_lab?("Pans Labyrinth")
has_lab?("elaborate")
has_lab?("pola bear")

