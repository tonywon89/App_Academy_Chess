require_relative 'display'
require_relative 'player'
require 'byebug'
class Game

  attr_accessor :current_player

  def initialize(player1, player2, board)
    @player1, @player2 = player1, player2
    @board = board
    @display = Display.new(board)
    @current_player = player1
  end

  def switch_player!
    @current_player = current_player == @player1 ? @player2 : @player1
  end

  def play_turn

    @display.render(@current_player)
    begin
      start_pos = current_player.get_input(@display)
      end_pos = current_player.get_input(@display)

      piece = @board[start_pos]

      if piece.color != current_player.color
        raise InvalidMoveError, "Thatis not your piece"
      elsif !piece.valid_moves.include?(end_pos)
        raise InvalidMoveError, "That is not a valid move"
      end

    rescue InvalidMoveError => e
      puts e.message
      retry
    end

    @board.move(start_pos, end_pos)
    p piece.current_pos
  end

  def play
    while true
      break if game_over?
      play_turn
      switch_player!
    end
    puts "Game Over"
  end

  def game_over?
    @board.checkmate?(@current_player.color)
  end

end

player1 = HumanPlayer.new("Tony", :white)
player2 = HumanPlayer.new("Albert", :black)
game = Game.new(player1, player2, Board.new)
game.play
