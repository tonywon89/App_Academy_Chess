require_relative 'piece'

class Pawn < Piece

  def initialize(board, pos, color)
    super(board, pos, color)
    @initial_pos = pos.dup
    @symbol = color == :white ? "\u2659" : "\u265F"
  end

  def moves
    possible_moves =  starting_pos? ? initial_moves : forward_move
    possible_moves.concat(pawn_diag_moves)

  end

  def pawn_diag_moves
    diag_moves = []
    row, col = @current_pos
    if is_black?
      diag_moves.concat(black_diag_moves(row, col))
    elsif is_white?
      diag_moves.concat(white_diag_moves(row, col))
    end

    diag_moves.reject {|move| move.empty? }
  end

  def black_diag_moves(row, col)
    diag_moves = []

    dpos = [row - 1, col + 1]
    diag_moves << diag_move(dpos) if @board.in_bounds?(dpos)

    dpos = [row - 1, col - 1]
    diag_moves << diag_move(dpos) if @board.in_bounds?(dpos)

    diag_moves
  end

  def white_diag_moves(row, col)

    diag_moves = []

    dpos = [row + 1, col - 1]
    diag_moves << diag_move(dpos) if @board.in_bounds?(dpos)

    dpos = [row + 1, col + 1]
    diag_moves << diag_move(dpos) if @board.in_bounds?(dpos)

    diag_moves

  end

  def is_black?
    self.color == :black
  end

  def is_white?
    self.color == :white
  end

  def diag_move(dpos)
    piece = @board[dpos]
    opponent_piece?(piece) ? dpos : []
  end


  def opponent_piece?(piece)
    piece.is_a?(Piece) && piece.color != self.color
  end

  def starting_pos?
    @current_pos == @initial_pos
  end

  def initial_moves
    initial = []

    (1..2).each do |i|
      move = color_move(i)
      break if @board[move].is_a?(Piece)
      initial << move
    end

    initial
  end

  def forward_move
    move = color_move(1)
    @board.in_bounds?(move) && @board[move].is_a?(EmptySpace) ? [move] : []
  end


  def color_move(i)
    row, col = @current_pos
    @color == :white ? [row + i, col] : [row - i , col]
  end
end

# b = Board.new
# pos1 = [1, 2]
# pos2 = [2, 1]
# pos3 = [3, 2]
# pos4 = [2, 3]
#
# white_pawn1 = Pawn.new(b, pos1, :white)
# white_pawn2 = Pawn.new(b, pos2, :white)
# black_pawn1 = Pawn.new(b, pos3, :black)
# black_pawn2 = Pawn.new(b, pos4, :black)
#
# b[pos1] = white_pawn1
# b[pos2] = white_pawn2
# # b[pos3] = black_pawn1
# b[pos4] = black_pawn2
#
# p white_pawn1.moves
