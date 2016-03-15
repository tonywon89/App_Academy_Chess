require_relative 'piece.rb'
require_relative 'modules/slideable'

class Rook < Piece

  include Slideable

  def move_dirs
    Slideable::STRAIT_STEPS
  end

end

board = Board.new
r = Rook.new(board,[0,0])
p r.moves
