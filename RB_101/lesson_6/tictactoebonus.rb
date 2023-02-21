=begin
Tic Tac Toe is a 2 player game played on a 3x3 board. Each player takes
a turn and marks a square on the board. First player to reach 3 squares
in a row, including diagonals, wins. If all 9 squares are marked and no
player has 3 squares in a row, then the game is a tie.

- Below is the sequence of the gameplay a little more.

1. Display the initial empty 3x3 board.
2. Ask the user to mark a square.
3. Computer marks a square.
4. Display the updated board state.
5. If winner, display winner.
6. If board is full, display tie.
7. If neither winner nor board is full, go to #2
8. Play again?
9. If yes, go to #1
10. Good bye!
=end
require 'pry'
# Constants for values we need to keep referencing
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals

# A prompt method
def prompt(msg)
  puts "=> #{msg}"
end

# An improved join method that will make our program read better
def joinor(arr, seperator=', ', word='or')
  return '' if arr.size == 0
  if arr.size == 1
    arr[0].to_s
  elsif arr.size == 2
    arr.join(" #{word} ")
  else
    "#{arr[0..arr.size - 2].join(seperator)}#{seperator}#{word}" \
     " #{arr[arr.size - 1]}"
  end
end

# A method that will display a board
# the board that is passed is is a hash and the key correlates to the
# the space number
# rubocop:disable Metrics/AbcSize
def display_board(brd)
  # system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

# A method that displays the scores
def display_scores(score_tracker, round)
  system 'clear'
  prompt("-----+---Scores after round #{round}---+--------")
  prompt("Player_score = #{score_tracker[:player]}")
  prompt("Computer_score = #{score_tracker[:computer]}")
end

# A method that will be used to initialize our board, and set
# value to a an empty space
def intialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

# A method that initializes our score_tracker hash
def initialize_score_tracker
  new_board = {}
  new_board[:player] = 0
  new_board[:computer] = 0
  new_board
end

# A method that inspects the board to see the empty pairs of the board
# Will return an array of keys that have empty values
def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

# A procedural method that will allow the play to make a move
# This method has a side effect because it makes changes to the board
# Place a piece on the board, we have to pass in the baord, and the
# Player's action will modify the board, here Ruby is acting as PBR
def player_places_piece!(brd)
  square = ' '
  loop do
    prompt("Choose a position to  place a piece: #{joinor(empty_squares(brd))}")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

# A functional method that checks if there is any potential risk
# It returns a square that will help nulify the risk
def find_at_risk_square(brd)
  square = nil
  WINNING_LINES.each do |line|
    temp_values = brd.values_at(*line)
    if temp_values.count(PLAYER_MARKER) == 2 && temp_values.include?(' ')
      temp_index = temp_values.index(INITIAL_MARKER)
      return square = line[temp_index]
    end
  end
  square
end

# A functional method that will check to see if the computer can attack
# I.e to see if there is a square that will make the computer
def find_at_offense_square(brd)
  square = nil
  WINNING_LINES.each do |line|
    temp_values = brd.values_at(*line)
    if temp_values.count(COMPUTER_MARKER) == 2 && temp_values.include?(' ')
      temp_index = temp_values.index(INITIAL_MARKER)
      return square = line[temp_index]
    end
  end
  square
end

# A procedural method that will let the computer make a choice
# This method has a side effect because it makes changes to the board
def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  offense_value = find_at_offense_square(brd)
  risk_value = find_at_risk_square(brd)
  if offense_value
    square = offense_value
  elsif risk_value
    square = risk_value
  elsif empty_squares(brd).include?(5)
    square = 5
  end
  brd[square] = COMPUTER_MARKER
end

# A functional method that returns who starts the game
def player_decides_who_goes_first
  prompt("Who should go first?")
  gets.chomp
end

# A functional method that returns who starts the game
def computer_decides_who_goes_first
  ["player", "computer"].sample
end

# A procedural method that places a piece on the board based on the argument
def place_a_piece!(brd, current_player)
  if current_player == 'player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

# A functional method that returns the opposite of our argument
def alternate_player(current_player)
  return 'computer' if current_player == 'player'
  'player'
end

# A method that will use the empty squares method to determine if
# If the board is full.
def board_full?(brd)
  # empty_squares(brd) == []
  empty_squares(brd).empty?
end

# A method that will determine if someone won
# This method will make use of detect_winner to decide if we v a  winner
def someone_won?(brd)
  !!detect_winner(brd) # the !! is to force the method to produce a boolean
end

# This method will return a string if we have a winner or nil if no win
def detect_winner(brd)
  WINNING_LINES.each do |line|
    # if brd[line[0]] == PLAYER_MARKER &&
    #    brd[line[1]] == PLAYER_MARKER &&
    #    brd[line[2]] == PLAYER_MARKER
    #   return 'Player'
    # elsif brd[line[0]] == COMPUTER_MARKER &&
    #       brd[line[1]] == COMPUTER_MARKER &&
    #       brd[line[2]] == COMPUTER_MARKER
    #   return 'Computer'
    # end
    # we can use the splat operator instead of passing in each arg of array
    # replace with splate operator - line[0], line[1], line[2]
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

# A method that will increment whoever wins a round in the board
def increment!(winner, score_tracker)
  score_tracker[winner.to_sym] += 1
end

# This main body will keep prompting until someone gets 5 wins
loop do
  keep_score = initialize_score_tracker
  counter = 1 # For keeping track of the number of times we play game

  loop do
    # The board variable need to be here as we will be moving it around
    board = intialize_board

    # This is the main game loop that keeps playing until the board is full
    # Or we have a winner
    current_player = player_decides_who_goes_first
    loop do
      display_board(board)
      place_a_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    # display_board(board)

    if someone_won?(board)
      increment!(detect_winner(board).downcase, keep_score)
      display_scores(keep_score, counter)
      prompt "#{detect_winner(board)} won round #{counter}."
    else
      display_board(board)
      prompt "It's a tie!"
    end
    puts " "

    # display_board(board)
    break if keep_score.values_at(:player, :computer).include?(5)

    # Increment counter
    counter += 1
  end

  prompt("The winner of the game is #{keep_score.key(5).to_s.upcase}!")
  puts " "
  prompt("Play again? (y or n )")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
prompt("Thanks for playing Tic-Tac-Toe game!, Good Bye!")
