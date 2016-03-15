module Slideable

  DIRECTIONS = {
    straight: "straight",
    diagonal: "diagonal"
  }

  DIAG_STEPS = [
    [1,-1],
    [1, 1],
    [-1, 1],
    [-1,-1]
  ]

  def moves
    possible_moves = []

    self.move_dirs.each do |drow,dcol|
      row, col = @current_pos
      while true
        dpos = [row + drow, col + dcol]
        break unless @board.in_bounds?(dpos)
        possible_moves << dpos
        row, col = dpos
      end
    end
    possible_moves.uniq
  end

  def move_dirs
    DIAG_STEPS
  end
end
