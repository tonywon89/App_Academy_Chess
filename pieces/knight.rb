require_relative 'piece'
require_relative 'modules/steppable'

class Knight < Piece
  
  include Steppable

  def move_dirs
    Steppable::KNIGHT_STEPS
  end

end
