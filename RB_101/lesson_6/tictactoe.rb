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
     " #{arr[arr.size - 1].to_s}"
  end
end

# A method that will display a board
# the board that is passed is is a hash and the key correlates to the
# the space number
# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
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

# A method that will be used to initialize our board, and set
# value to a an empty space
def intialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

# A method that inspects the board to see the empty pairs of the board
# Will return an array of keys that have empty values
def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

# A method that will allow the play to make a move
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

# A method that will let the computer make an intelligent choice.
# We are incoporating the computer AI: defense as required in boonus 3
def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
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

loop do
  # The board varaibale will keep the state of our game, and we will need
  board = intialize_board

  # This is the main game loop that keeps playing until the board is full
  # Or we have a winner
  loop do
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  prompt("Play again? (y or n )")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
prompt("Thanks for playing Tic-Tac-Toe game!, Good Bye!")
