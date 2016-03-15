require_relative '../board'

class Piece

  attr_accessor :current_pos, :board

  def initialize(board, pos)
    @board = board
    @current_pos = pos
  end

end
