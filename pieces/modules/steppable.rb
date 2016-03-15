module Steppable
  KNIGHT_STEPS = [
    [2, 1],
    [2, -1],
    [-2, 1],
    [-2, -1],
    [1, 2],
    [1, -2],
    [-1, 2],
    [-1, -2]
  ]
  KING_STEPS = [
    [0, 1],
    [0, -1],
    [1, 0],
    [-1, 0],
    [1, 1],
    [-1, -1],
    [1, -1],
    [-1, 1]
  ]

  def moves
    possible_moves = []

    self.move_dirs.each do |drow, dcol|
      row, col = @current_pos
      dpos = [drow + row, dcol + col]
      possible_moves << dpos if @board.in_bounds?(dpos) && @board[dpos].color != self.color
    end

    possible_moves
  end
end
