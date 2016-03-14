require_relative 'pieces'
class Board

  def self.create_empty_grid
    Array.new(8) { Array.new(8) { EmptySpace.new } }
  end

  def initialize(grid = Board.create_empty_grid)
    @grid = grid
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  def move(start_pos, end_pos)

  end

end
