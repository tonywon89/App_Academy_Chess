require_relative '../errors'

class EmptySpace

  def color
    :no_color
  end

  def to_s
    "   "
  end

  def move(pos)
    raise InvalidMoveError, "There is not a piece at this spot"
  end

  def valid_moves
    raise InvalidMoveError, "There is no piece to move there"
  end

end
