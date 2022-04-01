# Import yaml file into this program.
require 'yaml'
CHOICES = YAML.load_file('rock_paper_scissors_bonus.yml')

=begin
Rock paper scissors bonus question includes adding 2 more options; adding spoke
and lizard to the options to choose from.
- A game of 2 players, player and computer
- The player and computer chooses from the available choices
- Ties are replayed, meaning someone must win each round else repeat
- After 3 wins by either player, the player with >= 3 wins
- The program ends
=end

=begin
Pseudocode and problem deconstruction
- SET score_tracker = {} that will keep track of all the scores in real time
- Set a const VALID_CHOICES array which will have all the choices to pick from
- Define a method that displays a unique output, it will take string as input
- Get player choice, and validate the input.
- Get computer choice by using Array#sample method to pick from VALID CHOICES
- Now you have both choices available, PRINT what player and computer chose
- Validate to make sure that there are no ties, proceed if no ties, else repeat
- Build your logic to determine the winner, refer to the logic below:
- Define a winner method which wil determine the winner
  The winner method will take 3 parameters and a hash within.
  The key of the hash will be the possible moves a player can make(see choices)
  The value will be an array of the possible move a computer can make
  IF computer move is part of the values of the key, player wins then increment
  player score in the score_tracker hash and display round result
  ELSE computer wins - do same for computer
- PRINT or display the champion by invoking the champion_method
- Ask player if they want to play again, repeat if yes or break if no.
- As an addition, I also configured a yaml file which serves as a hash, the key
will be the player's input(first letter of the options) and values = full word
=end

# A constant variable used here as it acts as a global variable, it wont change
VALID_CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

# A score_record hash that will keep track of the player & computer scores
score_record = { player: 0, computer: 0 }

# A prompt method that displays a unique message
def prompt(message)
  puts "=> #{message}"
end

# Note, I want to use hereDoc below to allow me write multi lines of string
choices_prompt = <<-MSG
Please enter your choice(r, p, sc, l, sp):
r => rock
p => paper 
sc => scissors
l => lizard
sp => spock
MSG

# An increment method, that increments the score record based on name(winner)
def increment(name, score_tracker)
  score_tracker[name.to_sym] += 1
end

# A method that displays the champion or grand winner
def display_champion(player, computer, score_tracker)
  puts " "
  prompt("Final =========== results:")
  prompt("Player score = #{score_tracker[player.to_sym]}")
  prompt("Computer score = #{score_tracker[computer.to_sym]}")
  if score_tracker[player.to_sym] == 3
    prompt("Player is the champion!!! Yayyy..")
    puts ' '
  elsif score_tracker[computer.to_sym] == 3
    prompt("Computer is the champion!")
    puts ' '
  end
end

# A method that displays each round's winner.
def display_round_winner(name_of_winner, round, score_tracker)
  prompt("Round --- #{round} --- result:")
  score_tracker.each { |k, val| prompt("#{k.to_s.capitalize} score = #{val}") }
  if name_of_winner == 'player'
    prompt("Player won this round!")
  else
    prompt("Computer won this round!")
  end
  puts ' '
end

# A method that determines the winner, increments winner
def decide_winner(player_choice, computer_choice, score_tracker, round)
  # A hash containing the player move as a key and a list of moves
  # that the player's move beats
  # If player chooses a key, and computer choosess any of the values
  # in the list then player has won, else computer wins
  player_moves = {
    rock: ['scissors', 'lizard'],
    paper: ['spock', 'rock'],
    scissors: ['paper', 'lizard'],
    lizard: ['spock', 'paper'],
    spock: ['rock', 'scissors']
  }
  # check the winner, arr is an array of possible computer moves
  arr = player_moves[player_choice.to_sym]
  if arr.include?(computer_choice)
    increment('player', score_tracker)
    display_round_winner('player', round, score_tracker)
  else
    increment('computer', score_tracker)
    display_round_winner('computer', round, score_tracker)
  end
end

# A method that gets and verfies player_choice
def get_player_choice(choices_prompt)
  player_choice = ' '
  loop do
    prompt(choices_prompt)
    player_choice = gets.chomp.strip
    if VALID_CHOICES.include?(CHOICES[player_choice])
      player_choice = CHOICES[player_choice]
      break
    else
      prompt("You made an invalid choice, please enter a valid choice:")
      puts ' '
    end
  end
  player_choice
end

# A method that gets computer choice
def get_computer_choice
  VALID_CHOICES.sample
end

# A method that resets the scores in the hash
def reset(score_tracker)
  # this expression transforms the hash values to 0
  score_tracker.transform_values! { 0 }
end

# A method that asks the user if they want to play again
def play_again?(score_tracker)
  prompt("Do you want to play again?")
  answer = gets.chomp
  if answer.downcase.start_with?('y')
    system "clear"
    prompt("Welcome back!")
    reset(score_tracker)
    true
  else
    false
  end
end

# Welcome message
prompt("Welcome to rock, paper, scissors, lizard, spock game!")

# The loop to begin the game and controls its entire execution
loop do
  round = 1 # to keep track of each round
  # The until loop determines when the game should end
  until score_record.value?(3)
    # Variable for player & computer choices & scores,
    # Why here? - think variable scope
    player_choice = ' '
    computer_choice = ' '

    # This loop checks for ties between player and computer, we don't want ties
    loop do
      player_choice = get_player_choice(choices_prompt)
      computer_choice = get_computer_choice()
      prompt("Player chose: #{player_choice}")
      prompt("Computer chose: #{computer_choice}")
      puts ' '
      break if player_choice != computer_choice
      prompt("Seems we have a tie here, please make choice again:")
      puts ' '
    end
    # invoke the decide winne method
    decide_winner(player_choice, computer_choice, score_record, round)
    round += 1
  end

  # It's time to display champion!!!
  display_champion('player', 'computer', score_record)
  _round = 0 # reset round
  break unless play_again?(score_record)
end
prompt("Thank you for playing!!! bye")
