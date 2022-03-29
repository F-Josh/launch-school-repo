# It is a simple game, that allows the user to choose betwen rock, paper
# and sicssors, and after that, the computer is allowed to make a choice too
# then a winner emerges

# used a constant because we will keep making reference to the options
VALID_CHOICES = ['rock', 'paper', 'scissors']

# A generic prompt method that displays a unique message
def prompt(message)
  Kernel.puts("=> #{message}")
end

# we broke down the logic here to pass rubocop test
def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

# A display_results method that calculates and displays winner
def display_results(player, computer)
  # calculation of who wins
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie")
  end
end

# Start the program here, the user plays first
loop do
  user_choice = ''
  loop do
    # used .join to make the array elements appear as a sentenece
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    user_choice = Kernel.gets().chomp()

    # validate input to make sure the user selected from valid_choices
    if VALID_CHOICES.include?(user_choice)
      break
    else
      prompt("That's not a valid choice, please select a valid choice:")
    end
  end

  # Computer plays next, use the Array#sample method to pick options at random
  computer_choice = VALID_CHOICES.sample
  prompt("You chose: #{user_choice} Computer chose: #{computer_choice}")

  # Invoke the display_results method
  display_results(user_choice, computer_choice)

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")
