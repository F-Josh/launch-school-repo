require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]]            # diagonals

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end
def display_board(brd)
  #system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
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
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def initialize_score_tracker
  tracker = { player_score: 0, computer_score: 0 }
end

def joinor(arr, sign1=', ', sign2='or ')
  arr_size = arr.size
  case arr_size
  when 0
    "Invalid array, please enter again"
  when 1
    "#{arr[0]}"
  when 2
    "#{arr.join(sign2)}"
  else
    last_element = arr[arr_size - 1]
    new_arr = arr.dup
    new_arr.delete_at(arr_size - 1)
    new_arr.join(sign1) + sign1 +  sign2 +  last_element.to_s
  end
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry, that's not a valid condition! Enter again")
  end
    brd[square] = PLAYER_MARKER
end

def find_at_risk(brd)
  WINNING_LINES.each do |line|
    values= brd.values_at(*line)
    if values.count(PLAYER_MARKER) == 2 && values.include?(INITIAL_MARKER)
      idx = values.index(INITIAL_MARKER)
      #binding.pry
      return square = line[idx]
    end
  end
  nil
end

def find_attack(brd)
  WINNING_LINES.each do |line|
    values= brd.values_at(*line)
    if values.count(COMPUTER_MARKER) == 2 && values.include?(INITIAL_MARKER)
      idx = values.index(INITIAL_MARKER)
      #binding.pry
      return square = line[idx]
    end
  end
  nil
end

def available?(num, brd)
  empty_squares(brd).include?(num)
end

def computer_places_piece!(brd)
  square = nil

  attack_square = find_attack(brd)

  if attack_square
    square = attack_square
  else
    square = find_at_risk(brd)
  end

  square = 5 if available?(5, brd)

  if  !square
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd, score_tracker)
  !!detect_winner(brd, score_tracker)
end

def increment(winner, score_tracker)
  winner = winner.downcase + "_score"
  winner = winner.to_sym
  score_tracker[winner] += 1
end

def detect_winner(brd, score_tracker)
  WINNING_LINES.each do |line|
    #binding.pry
    # if brd[line[0]] == PLAYER_MARKER &&
    #    brd[line[1]] == PLAYER_MARKER &&
    #    brd[line[2]] == PLAYER_MARKER
    #  return "Player"
    # elsif brd[line[0]] == COMPUTER_MARKER &&
    #       brd[line[1]] == COMPUTER_MARKER &&
    #       brd[line[2]] == COMPUTER_MARKER
    #  return 'Computer'
    # end

    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      # increment("player", score_tracker) bugy
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      #increment('computer', score_tracker) bugy..
      return 'Computer'
    end
    #binding.pry
  end
  nil
end

def display_grand_winner(tracker)
  system 'clear'
  winner = tracker.key(5)
  if winner == :player_score
    prompt ("Player is the grand winner! yaayyy..")
  else
    prompt ("Computer is the grand winner! yaayyy..")
  end
end

def places_piece!(brd, current_player)
  if current_player == 'player'
    player_places_piece!(brd)
  else
   computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  return 'computer' if current_player == 'player'
  'player'
end

# main game logic
loop do 
  score_tracker = initialize_score_tracker
  round = 1

  until score_tracker.value?(5)
    board = initialize_board

    won = false
    current_player = 'player'  # can be decided by player/computer at random

    loop do
      display_board(board)

      places_piece!(board, current_player)
      current_player = alternate_player(current_player)
      
      won = someone_won?(board, score_tracker)
      break if won || board_full?(board)

    end

    display_board(board)
    #binding.pry

    if won
      winner = detect_winner(board, score_tracker)
      prompt "#{winner} won round #{round}!"
      increment(winner, score_tracker)
    else
      prompt "It's a tie in round #{round}!"
    end
    #binding.pry
    round += 1
  end

 #Display grand_winner
  display_grand_winner(score_tracker)

  prompt 'Play again? (y or n)'
  answer = gets.chomp

  break unless answer.start_with?('y')
end

prompt('Thanks for playing tictactoe, goodbye!')

