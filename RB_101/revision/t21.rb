
def prompt(msg)
  puts "=> #{msg}"
end
# First will be to hav a hash object that will hold our entire data
def initialize_game_tracker
  new_hsh = {}
  cards_arr = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace'] * 4
  new_hsh[:cards] = cards_arr.shuffle
  new_hsh[:player_cards] = []
  new_hsh[:dealer_cards] = []
  new_hsh[:player_score] = 0
  new_hsh[:dealer_score] = 0
  new_hsh
end

# first dole out cards to the player and user. A destructive method. Since it 
# has a side effect, we don't care about return value
def dole_initial_cards!(hsh)
  card_deck = hsh[:cards]
  2.times do |_|
    idx = rand(card_deck.size)
    value = card_deck.delete_at(idx)
    hsh[:player_cards] << value
    increase_score('player', value, hsh)
    idx = rand(card_deck.size)
    value = card_deck.delete_at(idx)
    hsh[:dealer_cards] << value
    increase_score('dealer', value, hsh)
  end
end

# A method that returns an integer
def integer_value(player, val, hsh)
  case val
  when 'jack', 'queen', 'king'
      10
  when 'ace'
    if score_of(player, hsh) + 11 <= 21
      11
    else
      1
    end
  else
    val
  end
end

def increase_score(player, val, hsh)
  int_val = integer_value(player, val, hsh)
  player_score = player + '_score'
  hsh[player_score.to_sym] += int_val
end

# A method that returns the player scores
def score_of(player, hsh)
  player = player + '_score'
  hsh[player.to_sym]
end

def dole_a_card!(player, hsh)
  card_deck = hsh[:cards]
  idx = rand(card_deck.size)
  player_cards = player + '_cards'
  value = card_deck.delete_at(idx)
  hsh[player_cards.to_sym] << value
  increase_score(player, value, hsh)
end

def bust?(player, hsh)
  player_score = player + '_score'
  hsh[player_score.to_sym] > 21
end

# player turn
def player_turn(hsh)
  options = ['stay', 'hit']
  answer = nil
  # This loop is for sanity checks
  loop do
    prompt("Enter hit or stay")
    answer = gets.chomp
    break if options.include?(answer)
    prompt("Invalid input, please enter again!")
  end
  answer
end

# a method that decides winner, we need the return value, so no side effect
def decide_winner(hsh)
  player_score = score_of('player', hsh)
  dealer_score = score_of('dealer', hsh)
  if bust?('player', hsh)
    prompt("Oh oh player busted!")
    'dealer'
  elsif bust?('dealer', hsh)
    prompt("Oh oh dealer busted!")
    'player'
  elsif player_score > dealer_score
    'player'
  elsif dealer_score > player_score
    'dealer'
  end
end

# A method that displays just winners alone. Yes side effect
def display_winner(hsh)
  winner = decide_winner(hsh)
  if winner == 'player'
    prompt("Player is the winner of the game!")
  elsif winner == 'dealer'
    prompt("Dealer is the winner of the game!")
  else
    prompt(' We have a tie!')
  end
end

def play_again?
  #system 'clear'
  puts " "
  prompt('Do you want to play again?')
  answer = gets.chomp
  return true if answer.start_with?('y')
  false
end

def dealer_turn(hsh)
  # dealer will keep hitting until the below condition is met
  loop do
    break if hsh[:dealer_score] > 17
    dole_a_card!('dealer', hsh)
  end
end

def display_dealer_cards(hsh)
  arr = hsh[:dealer_cards]
  card = arr[0]
  prompt("Dealer has: #{card} and unknown card")
end

def display_player_cards(hsh)
  arr = hsh[:player_cards]
  cards = join_and(arr, 'and')
  prompt("Player's cards: #{cards}")
end

def join_and(arr, seperator='and')
  new_arr = arr[0...arr.size - 1]
  str = new_arr.join(', ')
  last_str = arr[-1].to_s
  str + " " + seperator + " " + last_str
end

def display_all_cards(hsh)
  player_cards = hsh[:player_cards]
  dealer_cards = hsh[:dealer_cards]
  puts " "
  puts '+-----Player cards+----- '
  prompt("#{player_cards}")
  puts '+-----Dealer cards+----- '
  prompt("#{dealer_cards}")
end

def display_scores(hsh)
  player_score = score_of('player', hsh)
  dealer_score = score_of('dealer', hsh)
  prompt("Player's final score: #{player_score}")
  prompt("Dealer's final score: #{dealer_score}")
end

loop do
  system 'clear'
  # First initialize the data structure that will be passed around
  game_tracker = initialize_game_tracker
  dole_initial_cards!(game_tracker)
  player_response =  nil
  display_dealer_cards(game_tracker)

  loop do
    break if bust?('player', game_tracker) || player_response ==  'stay'
    display_player_cards(game_tracker)
    player_response = player_turn(game_tracker)
    dole_a_card!('player', game_tracker) if player_response == 'hit'
  end

  if bust?('player', game_tracker)
    puts " "
    display_winner(game_tracker)
    display_scores(game_tracker)
    display_all_cards(game_tracker)
    break unless play_again?
  elsif player_response == 'stay'
    puts " "
    prompt('Player chose to stay!')
    prompt("It's now dealer's turn")
    dealer_turn(game_tracker)
    display_winner(game_tracker)
    display_scores(game_tracker)
    display_all_cards(game_tracker)
    break unless play_again?
  end
end

prompt("Thank you for playing this game!")
