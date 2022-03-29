def map_to_index(str)
  #map each character in the array to its index
  hm = Hash.new
  counter = 0
  str.each_char do |cha| 
  hm[cha] = counter
  counter += 1
  end 
  hm
end 

def map_to_count(str)
  hm2 = Hash.new(0)
  str.each_char{|item| hm2[item] +=1}
  hm2
end 


p  map_to_count("Obinna")
