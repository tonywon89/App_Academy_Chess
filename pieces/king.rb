require_relative 'piece'
require_relative 'modules/steppable'

class King < Piece

  include Steppable

  def move_dirs
    Steppable::KING_STEPS
  end

end
