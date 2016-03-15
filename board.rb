require_relative 'pieces/empty_space'
require_relative 'pieces'

class Board

  def self.create_empty_grid
    Array.new(8) { Array.new(8) { EmptySpace.new } }
  end
  attr_accessor :grid

  def initialize(grid = Board.create_empty_grid)
    @grid = grid
    populate_grid
  end

  def populate_grid
    pawn_setup
    knight_setup
    king_setup
    queen_setup
    bishop_setup
    rook_setup
  end

  def bishop_setup
    rows = [0, 7]
    cols = [2, 5]
    rows.each do |row|
      cols.each do |col|
        pos = [row, col]
        bishop = row == 0 ? Bishop.new(self, pos, :white) : Bishop.new(self, pos, :black)
        self[pos] = bishop
      end
    end
  end

  def rook_setup
    rows = [0, 7]
    cols = [0, 7]
    rows.each do |row|
      cols.each do |col|
        pos = [row, col]
        rook = row == 0 ? Rook.new(self, pos, :white) : Rook.new(self, pos, :black)
        self[pos] = rook
      end
    end
  end

  def pawn_setup
    rows = [1,6]
    rows.each do |row|
      @grid.each_index do |col|
        pos = [row, col]
        pawn = row == 1 ? Pawn.new(self, pos, :white) : Pawn.new(self, pos, :black)
        self[pos] = pawn
      end
    end
  end

  def knight_setup
    rows = [0, 7]
    cols = [1, 6]
    rows.each do |row|
      cols.each do |col|
        pos = [row, col]
        knight = row == 0 ? Knight.new(self, pos, :white) : Knight.new(self, pos, :black)
        self[pos] = knight
      end
    end
  end

  def king_setup
    rows = [0, 7]
    rows.each do |row|
      pos = [row, 4]
      king = row == 0 ? King.new(self, pos, :white) : King.new(self, pos, :black)
      self[pos] = king
    end
  end

  def queen_setup
    rows = [0,7]
    rows.each do |row|
      pos = [row, 3]
      queen = row == 0 ? Queen.new(self, pos, :white) : Queen.new(self, pos, :black)
      self[pos] = queen
    end
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
