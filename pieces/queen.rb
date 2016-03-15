require_relative 'piece'
require_relative 'modules/slideable'

class Queen < Piece
  include Slideable

  def move_dirs
    Slideable::STRAIT_STEPS + Slideable::DIAG_STEPS
  end

end

p Queen.new(Board.new, [0,0]).moves
