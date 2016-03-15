

class Piece

  attr_accessor :current_pos, :board
  attr_reader :color

  def initialize(board, pos, color)
    @board = board
    @current_pos = pos
    @color = color
  end

  def to_s
    " #{@symbol.encode("utf-8")} "
  end

  def valid_moves
    valid_moves = []
    self.moves.each do |move|
      valid_moves << move unless move_into_check?(move)
    end
    valid_moves
  end

  def move_into_check?(move)
    board_copy = board.dup
    board_copy.move!(self.current_pos, move)
    board_copy.in_check?(self.color)
  end

end
