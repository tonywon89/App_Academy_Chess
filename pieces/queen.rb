require_relative 'piece'
require_relative 'modules/slideable'

class Queen < Piece
  include Slideable

  def move_dirs
    Slideable::STRAIT_STEPS + Slideable::DIAG_STEPS
  end

end
b = Board.new
black_queen = Queen.new(b, [1,1], :black)
white_queen =  Queen.new(b, [0,0], :white)
b[[2,2]] = black_queen
b[[0,0]] = white_queen
p white_queen.moves
