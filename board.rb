require_relative 'pieces/empty_space'


class Board

  def self.create_empty_grid
    Array.new(8) { Array.new(8) { EmptySpace.new } }
  end
  attr_accessor :grid

  def initialize(grid = Board.create_empty_grid)
    @grid = grid
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def size
    grid.length
  end

  def in_bounds?(pos)
    pos.all? { |x| x.between?(0, 7) }
  end

  def move(start_pos, end_pos)
    if self[start_pos].is_a?(EmptySpace)
      raise StandardError, "No piece in start position"
    elsif self[end_pos].is_a?(Piece)
      raise StandardError.new("Spot is currently occupied")
    else
      start = self[start_pos]
      self[start_pos] = EmptySpace.new
      self[end_pos] = start
    end
  rescue StandardError => e
    puts e.message
    retry
  end

end
