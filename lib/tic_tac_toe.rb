class TicTacToe
  def initialize(board = nil)
    @board = = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
    ]
    
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end  

  def move= (@index, token = "X")
    @board[@index] = token
    return @board
  end

  def position_taken?
    if @board[@index] == "X" || @board[@index] == "O"
      true
    else
      false
    end
  end

  def valid_move?
    if @index.between?(0, 8) && !position_taken?
      true
    else
      false
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    @index = input_to_index(user_input)
    if valid_move?
      token = current_player
      move(token)
      display_board
    else
      turn
    end
  end

  def turn_count(board)
    board.count { |position| position == "X" || position == "O" }
  end
  
  def current_player(board)
    turn_count(board).even?? "X" : "O"
  end


end





def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    true
  elsif board[index] == " " || board[index] == "" || board[index] == nil
    false
  end
end


def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
     win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
      
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
      
    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O" 
      return win_combination
    else
      false
    end
  end
  if false
    return false
  end
end
  
def full?(board)
  board.none?{|position| position == "" || position == " "}
end
  
def draw?(board)
  if !won?(board) && full?(board)
    true
  end
end
  
def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  end
end
  
def winner(board)
  if won?(board)
    win_combination = won?(board)
    return board[win_combination[0]]
  end
end
  
def play(board)
  until over?(board)
    turn(board)
  end  
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end  
end