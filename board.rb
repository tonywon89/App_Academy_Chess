require_relative 'pieces/empty_space'
require_relative 'pieces'
require_relative 'errors'

class Board

  def self.create_empty_grid
    Array.new(8) { Array.new(8) { EmptySpace.new } }
  end
  attr_accessor :grid

  def initialize(fill = true)
    @grid = Board.create_empty_grid
    populate_grid if fill
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
    piece = self[start_pos]
    self[start_pos] = EmptySpace.new
    piece.current_pos = end_pos
    self[end_pos] = piece


  end

  def in_check?(color)
    king_pos = find_king(color).current_pos

    pieces.any? do |piece|
      piece.color != color && piece.moves.include?(king_pos)
    end
  end

  def pieces
    rows.flatten.reject { |piece| piece.is_a?(EmptySpace) }
  end

  def checkmate?(color)

    our_pieces = []
    rows.each do |row|
      our_pieces += row.select { |piece| piece.is_a?(Piece) && piece.color == color }
    end

    self.in_check?(color) && our_pieces.all? { |piece| piece.valid_moves.empty? }
  end

  def dup
    new_board = Board.new(false)
    pieces_on_board.each do |piece|
      new_board[piece.current_pos] = piece.class.new(new_board, piece.current_pos ,piece.color)
    end
    new_board
  end

  def move!(start_pos, end_pos)
    piece = self[start_pos]
    self[end_pos] = piece

    self[start_pos] = EmptySpace.new
  end

  private

  def update_pos(piece, new_pos)
    piece.current_pos = new_pos
  end

  def pieces_on_board
      pieces = []

      rows.each do |row|
        row.each { |piece| pieces << piece if piece.is_a?(Piece) }
      end

      pieces
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

  def rows
    @grid
  end

  def find_king(color)
    king = nil
    rows.each do |row|
      row.each do |piece|
        king = piece if piece.color == color && piece.is_a?(King)
      end
    end
    king
  end
end
