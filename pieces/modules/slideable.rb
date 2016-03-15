module Slideable

  STRAIT_STEPS = [
    [1, 0],
    [-1, 0],
    [0, 1],
    [0, -1]
  ]

  DIAG_STEPS = [
    [1,-1],
    [1, 1],
    [-1, 1],
    [-1,-1]
  ]

  def moves
    possible_moves = []

    self.move_dirs.each do |drow,dcol|

      possible_moves.concat(get_directional_moves(drow,dcol))

    end
    possible_moves
  end

  def get_directional_moves(drow, dcol)
    row, col = @current_pos
    directional_moves = []

    while true
      dpos = [row + drow, col + dcol]

      break unless @board.in_bounds?(dpos)

      piece = @board[dpos]

      if piece.is_a?(EmptySpace)
        directional_moves << dpos
      elsif piece.color != self.color
        directional_moves << dpos
        break
      else
        break
      end

      row, col = dpos
    end
    directional_moves
  end



end
