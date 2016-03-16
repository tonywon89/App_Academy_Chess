require_relative 'display'
require_relative 'player'

class Game

  attr_accessor :current_player

  def initialize(player1, player2, board)
    @player1, @player2 = player1, player2
    @board = board
    @display = Display.new(board)
    @current_player = player1
  end

  def switch_player!
    @current_player = current_player == player1 ? player2 : player1
  end

  def play_turn
    @display.render
    start_pos = current_player.get_input(@display)
    end_pos = current_player.get_input(@display)
    @board.move(start_pos, end_pos)
  end

end

player1 = HumanPlayer.new("Tony")
player2 = HumanPlayer.new("Albert")
game = Game.new(player1, player2, Board.new)
game.play_turn
