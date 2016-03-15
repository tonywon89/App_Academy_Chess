require_relative 'piece'
require_relative 'modules/steppable'

class King < Piece

  include Steppable

  def initialize(*args)
    super
    @symbol = color == :white ? "\u2654" : "\u265A"
  end

  def move_dirs
    Steppable::KING_STEPS
  end

end


# b = Board.new
# black_king = King.new(b, [1,1], :white)
# white_king =  King.new(b, [2,2], :white)
#
# b[[1,1]] =  black_king
# b[[2,2]] = white_king
#
# p black_king.moves
