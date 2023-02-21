=begin
PEDAC
PEDA
  Inputs - 1 argument - an array
  Outputs - An occrence of each element in the array, print element along num
  Problem domain- 
  Explicit /Implicit - Implicit we have to map each element to an array
  and also the words in the array are case sensitive i.e 'car' != 'CAR'
  Questions- Should we handle the case of an empty array??

  Example:
  arr = ['car', 'house', 'car', 'hello']
  car => 2
  house => 1
  hello > 1

  Datastructure -  hash will be used to hold key  - value pairs

  Algorithm:
    - Initialize an empty hash with a value of 0,
    - Iterate over the array using the each method, and let each item in the
    - Array serve as a key to the hash while the value w

Code with intent 
=end

def count_occurrences(arr)
  if arr.class != Array || arr.size == 0
    puts "Wrong argument or empty array"
  else
    a_hash = Hash.new(0)
    arr.each{ |elem| elem.downcase!; a_hash[elem] += 1}
  end
  a_hash.each{|k, v| puts " #{k} => #{v}"}
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV','suv', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

