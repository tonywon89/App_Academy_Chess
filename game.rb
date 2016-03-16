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

    start_pos = current_player.get_input(@display)
    until @board[start_pos].color == current_player.color
      start_pos = current_player.get_input(@display)
    end

    end_pos = current_player.get_input(@display)
    until @board[start_pos].valid_moves.include?(end_pos)
      end_pos = current_player.get_input(@display)
    end

    @board.move(start_pos, end_pos)
  end

  def play
    until @board.checkmate?(@current_player.color)
      play_turn
      switch_player!
    end
    puts "Game Over"
  end


end

player1 = HumanPlayer.new("Tony", :white)
player2 = HumanPlayer.new("Albert", :black)
game = Game.new(player1, player2, Board.new)
game.play
