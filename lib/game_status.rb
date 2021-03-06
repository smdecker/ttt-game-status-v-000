#require 'pry'
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
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


def won?(board)
  WIN_COMBINATIONS.detect do |array|
    #if array[0] == "X" || array[0] == "O"
    #  array
    #elsif array[1] == "X" || array[1] == "O"
    #  array
    #elsif array[2] == "X" || array[2] == "O"
    #  array
    #else
    #  false
    #
    #binding.pry
    board[array[0]] == board[array[1]] &&
    board[array[1]] == board[array[2]] &&
    position_taken?(board, array[0])
  end
end

def full?(board)
  WIN_COMBINATIONS.all? do |full_board|
    position_taken?(board, full_board[0]) &&
    position_taken?(board, full_board[1]) &&
    position_taken?(board, full_board[2])
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if win_positions = won?(board)
    board[win_positions[0]]
  else
    nil
  end
end
