require_relative '../board'

class Piece

  attr_accessor :current_pos, :board

  def initialize(board, pos, color)
    @board = board
    @current_pos = pos
    @color = color
  end

end
