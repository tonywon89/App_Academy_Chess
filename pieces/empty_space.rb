class EmptySpace
  def to_s
    "  "
  end

  def move(pos)
    raise StandardError, "There is not a piece at this spot"
  end


end
