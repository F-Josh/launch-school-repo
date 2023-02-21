=begin
Psudocode
- SET VALID_CHOICES = ['rock', 'paper', 'scissors']
- A method that gets and validates player_choice
- A method that gets and validates computer_choice
=end

VALID_CHOICES = ['r', 'p', 's', 'l', 'sp']
game_tracker  = {r: ['l', 's'], p: ['r', 'sp'], s: ['l', 'p'], l: ['p', 'sp'],
                 sp: ['r', 's'], player_score: 0, computer_score: 0}

def prompt(message)
  puts("=> #{message}")
end

# Will use Heredoc for lining up my string
options = <<-MSG
  r - rock
  p - paper
  s - scissors
  l - lizard
  sp - spock
MSG

def convert(option)
  case option
  when 'r' then 'rock'
  when 'p' then 'paper'
  when 's' then 'scissors'
  when 'l' then 'lizard'
  when 'sp' then 'spock'
  end
end

def player_choice(options)
  choice = ' '
  loop do
    prompt("Please choose either('r', 'p', 's', 'l', 'sp')\n#{options}")
    choice = gets.chomp
    break if VALID_CHOICES.include?(choice)
    prompt("Invalid choice, choose from('r', 'p', 's', 'l', 'sp'):")
  end
  prompt("You chose: #{convert(choice)}")
  choice
end

def computer_choice
  choice = VALID_CHOICES.sample
  prompt("Computer chose: #{convert(choice)}")
  choice
end

def increment(winner, tracker)
  tracker[winner] += 1
end

# The main program logic
def decide_winner(player_choice, computer_choice, tracker)
  if player_choice == computer_choice
    prompt('We have a tie!')
  elsif tracker[player_choice.to_sym].include?(computer_choice)
    increment(:player_score, tracker)
    prompt('Player won!')
  else
    increment(:computer_score, tracker)
    prompt('Computer won!')
  end
end

def reset(tracker)
  tracker[:player_score] = 0
  tracker[:computer_score] = 0
end

def play_again?(tracker)
  prompt("Do you want to play again?")
  answer = gets.chomp
  if answer.downcase.start_with?('y')
    system "clear"
    prompt("Welcome back!")
    reset(tracker)
    true
  else
    false
  end
end

loop do
  until game_tracker.value?(3)
    player = player_choice(options)
    computer = computer_choice
    decide_winner(player, computer, game_tracker)
  end

  puts " "
  
  grand_winner = game_tracker.key(3).to_s.split('_')
  prompt("player score = #{game_tracker[:player_score]}")
  prompt("computer score = #{game_tracker[:computer_score]}")
  prompt("The grand winner is #{grand_winner[0]}!")

  break unless play_again?(game_tracker)
end

prompt("Thank you for playing Rock Paper Scissors! Good bye!!!")