WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]


def display_board(board)
    puts " #{board[0]} " + "| #{board[1]} |" + " #{board[2]} "
    puts "-----------"
    puts " #{board[3]} " + "| #{board[4]} |" + " #{board[5]} "
    puts "-----------"
    puts " #{board[6]} " + "| #{board[7]} |" + " #{board[8]} "
end


def input_to_index(user_input)
    user_input.to_i - 1
end

def turn_count(board)
  counter = 0
  board.each do |token|
      if token == "X" || token == "O"
          counter += 1
      end
  end
  counter
end

def current_player(board)
  turn_count(board).even? == true ? "X" : "O"
end


def move(board, index, player)
  board[index] = player
end

def position_taken?(board, index)
    if board[index] == " " || board[index] == "" || board[index] == nil
        return false
    else board[index] == "X" || board[index] == "O"
        return true
    end
end



def valid_move?(board, index)
    if index.between?(0,8)  && position_taken?(board, index) == false
        return true
    elsif position_taken?(board,index) == true
        return false
    else index < 0 || index > 8
        return nil
    end
end


def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(board, index)
      move(board, index, current_player(board))
      display_board(board)
    else
      turn(board)
    end
  end

  
  def won?(board)
    WIN_COMBINATIONS.select do |combo|
     spot1 = board[combo[0]]
     spot2 = board[combo[1]]
     spot3 = board[combo[2]]
 
     if spot1 == "X" && spot2 == "X" && spot3 == "X"
       return combo
     elsif spot1 == "O" && spot2 == "O" && spot3 =="O"
       return combo
       end
     end
      false
 end
 

 def full?(board)
   board.none? {|token| token == "" || token == " "}
 end
 

 def draw?(board)
   !won?(board) && full?(board)
 end
 

 def over?(board)
   if won?(board) != false || full?(board) == true || draw?(board) == true
     return true
   end
 end
 

 def winner(board)
  if won?(board)
   return board[won?(board)[0]]
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

