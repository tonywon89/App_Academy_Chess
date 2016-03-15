require_relative 'piece.rb'
require_relative 'modules/slideable'

class Rook < Piece

  include Slideable

  def initialize(*args)
    super
    @symbol = color == :white ? "\u2656" : "\u265C"
  end

  def move_dirs
    Slideable::STRAIT_STEPS
  end

end
#
# board = Board.new
# r = Rook.new(board,[0,0])
# p r.moves
