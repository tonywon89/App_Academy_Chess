class HumanPlayer
  attr_reader :color, :name
  def initialize(name, color)
    @name = name
    @color = color
  end

  def get_input(display)
    input = nil
    until input
      display.render(self)
      input = display.get_input
    end
    input
  end

end
