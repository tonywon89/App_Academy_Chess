require_relative 'piece'
require_relative 'modules/slideable'

class Bishop < Piece

  include Slideable

  def move_dirs
    Slideable::DIAG_STEPS
  end

end

p Bishop.new(Board.new, [1,1]).moves
