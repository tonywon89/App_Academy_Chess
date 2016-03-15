require_relative 'piece'
require_relative 'modules/steppable'

class Knight < Piece

  include Steppable

  def initialize(*args)
    super
    @symbol = color == :white ? "\u2658" : "\u265E"
  end

  def move_dirs
    Steppable::KNIGHT_STEPS
  end

end
