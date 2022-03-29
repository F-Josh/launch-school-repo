# Import yaml file into this program.
require 'yaml'
CHOICES = YAML.load_file('rock_paper_scissors_bonus.yml')

=begin
Rock paper scissors bonus question includes adding 2 more options; adding spoke
and lizard to the options to choose from.
- A game of 2 players, player and computer
- The player and computer chooses from the available choices and whoever is the
- Ties are replayed, meaning someone must win each round else repeat
- After 3 wins by either player, the player with >= 3 wwins
- The program ends
=end

=begin
Pseudocode and problem deconstruction
- Set a const VALID_CHOICES  array which will have all the choices to pick from
- Define a method that displays a unique output, it will take string as input
- Initialize a variable outside of the loop to capture player & computer choice
- Ask the players to make a choice and validate from the VALID_CHOICES array
  Break out of the loop if the player choice is valid else repeat
- Use the Array#sample method to make a random choice from the VALID_CHOICES
  and SET the return object to a variable computer_choice
- Now you have both choices available, display what player and computer chose
- Validate to make sure that there are no ties, proceed if no ties, else repeat
- Build your logic to determine the winner, refer to the logic below:
- Define a winner method which wil determine the winner
  The winner method will take 2 parameters, and will have a hash.
  The key of the hash will be the possible moves a player can make(see choices)
  The value will be an array of the possible move a computer can make
  IF computer move is part of the values of the key, player wins
  ELSE computer wins
- Define a method that will display result for each round, this method will
  use the winner method defined above to make that decision
- Define a method that will display the final result, this method will need 2
  arguments, player score and computer score
-As an addition, I also configured a yaml file which serves as a hash, the key
 will be the player's input(first letter of the options) and values = full word
=end

# A constant variable used here as it acts as a global variable, it wont change
VALID_CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

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

# A method that displays results of winner
def display_results(player_score, computer_score)
  puts " "
  prompt("Final =========== results:")
  prompt("Player score = #{player_score}")
  prompt("Computer score = #{computer_score}")
  if player_score >= 3
    prompt("Player is the grand winner! Yayyy..")
    puts ' '
  elsif computer_score >= 3
    prompt("Computer is the grand winner!")
    puts ' '
  end
end

# A method that displays each round's winner
def display_round_winner(player_choice, computer_choice)
  if winner(player_choice, computer_choice) == 'player_won'
    prompt("Player won this round!")
  else
    prompt("Computer won this round!")
  end
end

# A method that determines the winner and returns a value
def winner(player, computer)
  # A hash containing the player move as a key and a list of moves
  # that the player's move beats
  # If player chooses a key, and computer choosess any of the values
  # in the list then player has won, else computer wins
  player_move = {
    rock: ['scissors', 'lizard'],
    paper: ['spock', 'rock'],
    scissors: ['paper', 'lizard'],
    lizard: ['spock', 'paper'],
    spock: ['rock', 'scissors']
  }
  # check the winner, arr is an array of possible computer moves
  arr = player_move[player.to_sym]
  if arr.include?(computer)
    'player_won'
  else
    'computer_won'
  end
end

# Variable for player & computer choices & scores, why here? - variable scope
player_choice = ''
computer_choice = ''
player_score = 0
computer_score = 0

# Welcome message
prompt("Welcome to rock, paper, scissors, lizard, spock game!")
# The loop to begin the game
loop do
  # The until loop determines when the game should end
  until player_score == 3 || computer_score == 3
    # This loop checks for ties between player and computer, we don't want ties
    loop do
      # This loop is for validation of player_choice
      loop do
        # Use Array#join method to display the elements of valid choices
        # prompt("Please make a choice: #{VALID_CHOICES.join(', ')}")
        prompt(choices_prompt)
        player_choice = gets.chomp.strip

        # Validate user choice using Array#include method
        if VALID_CHOICES.include?(CHOICES[player_choice])
          break
        else
          prompt("You made an invalid choice, please enter a valid choice:")
          puts ' '
        end
      end

      # Computer plays next -Use Array#sample method to make a choice at random
      computer_choice = VALID_CHOICES.sample
      prompt("You chose: #{CHOICES[player_choice]}")
      prompt("Computer chose: #{computer_choice}")
      # Validate to make sure that there are no ties, else repeat until no ties
      if CHOICES[player_choice] != computer_choice
        # Display the winner of each round by calling the below method.
        display_round_winner(CHOICES[player_choice], computer_choice)
        puts " "
        break
      else
        prompt("Seems we have a tie here, please make choice again:")
        puts ' '
      end
    end
    # The logic methods goes here, calls the winner method to decide winner
    # Then increment whoever won
    if winner(CHOICES[player_choice], computer_choice) == 'player_won'
      player_score += 1
    else
      computer_score += 1
    end
  end

  # once done, display result
  display_results(player_score, computer_score)

  # Ask user if they want to play the game again? if yes, reset scores
  prompt("Do you want to play the game again?")
  answer = gets.chomp
  if answer.downcase().start_with?('y')
    player_score = 0
    computer_score = 0
    # This line clears the screen before starting over
    system "clear"
  else
    break
  end
end

prompt("Thank you for playing the game, bye!!!")
