class HumanPlayer

  def initialize(name)
    @name = name
  end

  def get_input(display)
    input = nil
    until input
      display.render
      input = display.get_input
    end
    input
  end

end
