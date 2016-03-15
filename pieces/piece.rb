require_relative '../board'

class Piece

  attr_accessor :current_pos, :board
  attr_reader :color

  def initialize(board, pos, color)
    @board = board
    @current_pos = pos
    @color = color
  end

end
