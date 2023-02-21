=begin
1. Initialize deck
  - This will be a hash:
    deck => [2, 3, 4, 5, 6, 7, 8, 9, "jack", "queen", "king", "ace"]
    player_cards => an array of player_cards
    dealer_cards => an array of dealer_cards
    Randomly assign 2 numbers from the deck to player and dealer arrays
    player_score => 0 - This will keep track of the scores
    dealer_score => 0 - will keep track of scores
  -

2. Deal cards to player and dealer
3. Player turn: hit or stay
  - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.
=end

# A functional metod that adds style to the output
def prompt(msg)
  puts "=> #{msg}"
end

# A procedural method that initializes our deck
def initialize_game
  # This will be an array of arays
  hsh = {}
  hsh[:deck] = [2, 3, 4, 5, 6, 7, 8, 9, "Jack", "Queen", "King", "Ace"] +
               [2, 3, 4, 5, 6, 7, 8, 9, "Jack", "Queen", "King", "Ace"] +
               [2, 3, 4, 5, 6, 7, 8, 9, "Jack", "Queen", "King", "Ace"] +
               [2, 3, 4, 5, 6, 7, 8, 9, "Jack", "Queen", "King", "Ace"]
  hsh[:player_cards] = []
  hsh[:dealer_cards] = []
  hsh[:player_score] = 0
  hsh[:dealer_score] = 0
  hsh
end

# A method that will dole out a card randomly from the deck and remove it.
# The method is expected to return a card from the deck which will be removed.
def dole_out_card!(hsh)
  deck_of_cards = hsh[:deck]
  card = deck_of_cards.sample
  deck_of_cards.delete_at(deck_of_cards.index(card))
end

# A method that returns the score from our data structure
def get_score(player, hsh)
  key = player + "_score"
  key = key.to_sym
  hsh[key]
end

# A functional method that converts the value of the card to integer
# It will return the integer value of the card while keeping the rules in mind
def value_to_numeric(player, card_value, hsh)
  if ["Queen", "King", "Jack"].include?(card_value)
    10
  elsif card_value == "Ace"
    score = get_score(player, hsh)
    if score + 11 <= 21
      11
    else
      1
    end
  else
    card_value
  end
end

# A procedural  method to updates score. It has a side effect.
def update_score!(card_value, player, hsh)
  value = value_to_numeric(player, card_value, hsh)
  key = player + "_score"
  key = key.to_sym
  hsh[key] += value
end

# A method that doles out the first 2 cards to each player
def set_initial_cards!(hsh, player1, player2)
  # dole out the first initial 2 cards to each player
  2.times do
    card = dole_out_card!(hsh)
    hsh[:player_cards] << card
    update_score!(card, player1, hsh)

    card = dole_out_card!(hsh)
    hsh[:dealer_cards] << card
    update_score!(card, player2, hsh)
  end
end

# A method that gives dolls out card to player or dealer
def hit(hsh, player)
  prompt("#{player} is hitting...")
  card = dole_out_card!(hsh)
  key = player + "_cards"
  key = key.to_sym
  hsh[key] << card
  update_score!(card, player, hsh)
  value = value_to_numeric(player, card, hsh)
  prompt("#{player} just picked a card with the value of #{value}")
  display_cards(player, hsh)
  prompt("#{player}'s current total score is #{get_score(player, hsh)}")
end

# A method that checks if a player busted. Returns true or false
def busted?(hsh, player)
  get_score(player, hsh) > 21
end

# A method that displays cards
def display_initial_cards(hsh)
  prompt("Dealer has: #{hsh[:dealer_cards].sample} and an unknown card")
  prompt("You have: #{hsh[:player_cards][0]} and #{hsh[:player_cards][1]}" \
         " for a total score of #{get_score('player', hsh)}")
end

# A method that determines the winner
def determine_winner(hsh, player1, player2)
  player1_score = get_score(player1, hsh)
  player2_score = get_score(player2, hsh)
  if busted?(hsh, player1)
    player2
  elsif busted?(hsh, player2)
    player1
  elsif player1_score > player2_score
    player1
  elsif player2_score > player1_score
    player2
  else
    "We have a tie!"
  end
end

# A method that displays winner
def display_winner(hsh, player1, player2)
  puts " "
  puts "------++ See Final Scores Below ++------"
  prompt("#{player1} = #{get_score(player1, hsh)}")
  prompt("#{player2} = #{get_score(player2, hsh)}")
  winner = determine_winner(hsh, player1, player2)
  if [player1, player2].include?(winner)
    prompt("The winner is #{winner}!")
  else
    prompt(winner.to_s)
  end
end

def display_cards(player, hsh)
  key = player + "_cards"
  prompt("#{player} cards = #{hsh[key.to_sym]}")
end

def play_again?
  prompt("Do You want to play again?")
  answer = gets.chomp
  answer.start_with?("y")
end

loop do
  prompt("Welcome to Twenty-One Game!")
  game_tracker = initialize_game # We start by initializing our game
  # Then we dole out the initial cards to both players
  set_initial_cards!(game_tracker, "player", "dealer")
  # We then display the initial cards
  display_initial_cards(game_tracker)
  # Main game loop
  loop do
    # Player's turn
    puts " "
    loop do
      prompt('Player turn: would you like to "hit" or "stay"')
      answer = gets.chomp
      # next if !["hit", "stay"].include?(answer) # for input validation
      if !["hit", "stay"].include?(answer)
        prompt('Invalid input, please enter a valid input ("hit" or "stay")')
        next
      end

      break if answer == 'stay' || busted?(game_tracker, "player")

      # If the program gets here it means that answer == "hit"
      prompt("You chose to hit!")
      hit(game_tracker, "player")
      break if busted?(game_tracker, "player")
    end

    if busted?(game_tracker, "player")
      prompt("Oh! Oh! you have busted & lost the game because your score > 21")
      break
    else
      prompt("You chose to stay!")
      prompt("Your score as at now is #{get_score('player', game_tracker)}")
      puts " "
    end

    # Dealer's turn
    prompt("Dealer turn...")
    loop do
      break if get_score("dealer", game_tracker) >= 17
      hit(game_tracker, "dealer")
    end
    if busted?(game_tracker, "dealer")
      prompt("Oh Oh.. dealer busted & lost because score > 21")
      break
    end
    # This line is assuming the dealer decides to stay as well , then we end
    prompt("Dealer has decided to stay as well")
    break
  end

  # At this level we are assuming that the dealer is staying
  # So we just determine the winner and display result
  puts " "
  puts "-----++ See each player's cards below ++-----"
  display_cards("player", game_tracker)
  display_cards("dealer", game_tracker)
  display_winner(game_tracker, "player", "dealer")

  # Ask if player wants to play again?
  break unless play_again?
  system "clear"
end
prompt("Thank you for playing Twenty-One Game. Goodbye!")
