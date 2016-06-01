require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(board,round)
  system 'clear'
  prompt "--------------------Round #{round}--------------------"
  puts "You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def joinor(board, char=', ', conj='or')
  board.join(char).insert(-2, conj + " ")
end

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIAL_MARKER }
end

def player_places_piece!(board)
  square = ''
  loop do
    prompt "Choose a position to place a piece: #{joinor(empty_squares(board), ', ')}"
    square = gets.chomp.to_i
    break if empty_squares(board).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  board[square] = PLAYER_MARKER
end

def computer_places_piece!(board)
  square = nil

  # offense first
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, board, COMPUTER_MARKER)
    break if square
  end

  # defense
  if !square
    WINNING_LINES.each do |line|
    square = find_at_risk_square(line, board, PLAYER_MARKER)
    break if square
    end
  end

  # pick square 5 if available
  if !square
    square = 5 if empty_squares(board).include?(5)
  end

  # just pick a square
  if !square
  square = empty_squares(board).sample
  end

  board[square] = COMPUTER_MARKER
end

def board_full?(board)
  empty_squares(board).empty?
end

def someone_won?(board)
  !!detect_winner(board)
end

def detect_winner(board)
  WINNING_LINES.each do |line|
    if board.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif board.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def place_piece!(board, current_player)
  if current_player == 'Player'
    player_places_piece!(board)
  elsif current_player == 'Computer'
    computer_places_piece!(board)
  end
end

def alternate_player(current_player)
  current_player == 'Player' ? 'Computer' : 'Player'
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

def display_results(user_wins, computer_wins)
  if user_wins > computer_wins
    prompt("You won the game!")
  else
    prompt("Computer won the game!")
  end
end

def valid_answer?(answer)
  answer.downcase == 'y' || answer.downcase == 'n'
end

loop do # main loop
  user_wins = 0
  comp_wins = 0
  winner_found = false
  round = 1

  until winner_found == true
    board = initialize_board

    who_plays_first = ''
    loop do
        prompt "Do you want to play first? Enter Y or N"
        who_plays_first = gets.chomp
        break if valid_answer?(who_plays_first)
        prompt "Please type Y or N."
    end

    first_player = if who_plays_first.start_with?('y')
                      'Player'
                   else
                      'Computer'
                   end
    current_player = first_player

    loop do
      display_board(board, round)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board, round)

    if someone_won?(board) && detect_winner(board) == 'Player'
      prompt "#{detect_winner(board)} won this round!"
      user_wins += 1
    elsif someone_won?(board) && detect_winner(board) == 'Computer'
      prompt "#{detect_winner(board)} won this round!"
      comp_wins += 1
    else
      prompt "It's a tie!"
    end

    prompt "Current Score is User: #{user_wins} || Computer: #{comp_wins}"
    prompt "Press enter to continue... "
    Kernel.gets # pause the screen

    round += 1
    winner_found = true if user_wins == 5 || comp_wins == 5
  end

  display_results(user_wins, comp_wins)

  answer = ''
  loop do
    prompt "Do you want to play again? Enter Y or N"
    answer = gets.chomp
    break if valid_answer?(answer)
  end

  break unless answer.downcase == 'y'
end

prompt "Thanks for playing Tic Tac Toe! Goodbye!"
