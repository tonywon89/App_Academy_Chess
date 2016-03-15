require_relative 'piece'

class Pawn < Piece

  def initialize(board, pos, color)
    super(board, pos, color)
    @initial_pos = pos.dup
  end

  def moves

    possible_moves =  starting_pos? ? initial_moves : forward_move

    possible_moves

  end

  def starting_pos?
    @current_pos == @initial_pos
  end

  def initial_moves
    initial = []

    (1..2).each do |i|
      move = color_move(i)
      initial << move if @board.in_bounds?(move)
    end

    initial
  end

  def forward_move
    move = color_move(1)
    @board.in_bounds?(move) ? [move] : []
  end

  def color_move(i)
    row, col = @current_pos
    @color == "white" ? [row + i, col] : [row - i , col]
  end
end

p Pawn.new(Board.new,[6,1], "black").moves
