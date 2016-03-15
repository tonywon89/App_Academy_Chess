require_relative 'modules/slideable'
require_relative '../board'
class Piece
  attr_accessor :current_pos, :board
  include Slideable

  def initialize(board, pos)
    @board = board
    @current_pos = pos
  end

end

piece = Piece.new(Board.new,[1,1])
p piece.moves
