=begin
Rock, paper, scissors, lizard game
- Welcome user to the game
- Give user a set of input to choose from using HereDoc
- Get user's choice and store in a variable
- Randomly select for the computer using Array#sample method
=end
VALID_CHOICES = ['r', 'p', 's', 'l', 'sp']
choices = {r:'Rock', p:'Paper', s:'Scissors', l:'Lizard', sp:'Spock'}
game_tracker = {r:['l', 's'], p:['r', 'sp'], s:['l', 'p'], l:['p', 'sp'], 
                sp:['r', 's'], player_score: 0, computer_score: 0}

def prompt(msg)
  puts ("=> #{msg}")
end

options = <<-MSG
  r - rock
  p - paper
  s - scissors
  l - lizard
  sp - spock
MSG

# First get and validate player choice
def player_choice(options)
  choice = ' '
  loop do
    puts ("Please choose either 'r', 'p', 's', 'l', 'sp' \n#{options}")
    choice = gets.chomp
    break if VALID_CHOICES.include?(choice)
    puts "You entered an invalid choice, please enter again:"
  end
  choice
end

# Then get and validate computer choice
def computer_choice
  VALID_CHOICES.sample
end

# Incremenet the winner
def increment(winner, hsh)
  winner = winner + '_score'
  hsh[winner.to_sym] += 1
end

# Now get into the main game logic
def decide_winner(player_choice, computer_choice, hsh)
  if(hsh[player_choice.to_sym].include?(computer_choice))
    increment('player', hsh)
    "player"
  elsif (player_choice != computer_choice)
    increment('computer', hsh)
    'computer'
  end
end

# Display results
def display(winner)
  if (winner == 'player')
    prompt('Player won this round!')
  elsif (winner == 'computer')
    prompt("Computer won this round!")
  else
    prompt("We have a tie")
  end
end

def reset(hsh)
  hsh[:player_score] = 0
  hsh[:computer_score] = 0
end

def play_again?(hsh)
  puts ' '
  prompt("Do you want to play again?")
  answer = gets.chomp
  if answer.downcase.start_with?('y')
    system 'clear'
    prompt('Welcome back!')
    reset(hsh)
    true
  else
    false
  end
end

def display_grand_winner(hsh)
  prompt("Player is the grand winner yayyyy...") if hsh[:player_score] == 3
  prompt("Computer is the grand winner") if hsh[:computer_score] == 3
end

# Main Game logic
loop do
  round = 1
  until game_tracker.value?(3)
    player = player_choice(options)
    computer = computer_choice

    prompt("Player chose #{choices[player.to_sym]}")
    prompt("Computer chose #{choices[computer.to_sym]}")

    puts "  "

    round_winner = decide_winner(player, computer, game_tracker)

    prompt("---------+ Round #{round} result ---------+")
    display(round_winner)
    prompt("Player score = #{game_tracker[:player_score]}")
    prompt("Computer score = #{game_tracker[:computer_score]}")
    round += 1
    puts " "
  end

  puts "  "

  display_grand_winner(game_tracker)
  break unless play_again?(game_tracker)
end
prompt("Thanks for playing this game!")


