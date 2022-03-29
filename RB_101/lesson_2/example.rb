
=begin
def car(new_car)
  make = make(new_car)
  model = model(new_car)
  [make, model]
end 

def make(new_car)
  new_car.split(" ")[0]
end 

def model(new_car)
  new_car.split(" ")[2]
end 

make, model = car("Ford Mustang")
puts make == "Ford"
puts model.start_with?("M")
=end

=begin
require "pry"

counter = 0
loop do
  counter += 1
  binding.pry
  break if counter == 5
end
=end

=begin
the Kernel.tap() method yields self to a block, and returns self.
The primary purpose of this method is to "tap into" a method chain, in other to
perform operations on intermediate results within the chain
(1..10)                     .tap { |x| p x }
  .to_a                     .tap { |x| p x }
  .select { |x| x.even? }   .tap { |x| p x }
  .map {|x| x * x }         .tap { |x| p x }
=end




=begin
def add_name(name)
  puts name.object_id
  name = "hello"
  puts name.object_id
end

name = "Obinna"
puts name.object_id
add_name(name)
puts name
puts name.object_id
=end

=begin
new_hash = Hash.new(0)
new_hash = {player: += 1, soccer: += 1}
new_hash[:player]
p new_hash
end

def scores(name)
  score_hash = {player: 0, customer: 0}
  if name == 'player'
    score_hash[:player] += 1
  elsif name == 'computer'
    score_hash[:computer] += 1
  end
  score_hash
end
=end


def increment(name)
  player_score += 1
  computer_score = 0
  if name == 'player'
    player_score += 1
    store_result(player)
  elsif name == 'computer'
    computer_score += 1
    store_result(computer)
  end
end

def store_result(name)
  if name == 'player'
    










