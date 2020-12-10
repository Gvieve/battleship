class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @ship.nil?
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
     @fired_upon
  end

  def fire_upon
    if ship.nil? == true
      @fired_upon = true
    else ship.hit
      @fired_upon = true
    end
  end

  def render(show_ship = false)
    if show_ship && @ship && !@fired_upon
      "S"
    elsif @ship && @ship.sunk?
      "X"
    elsif @fired_upon && empty?
      "M"
    elsif @fired_upon && !empty?
      "H"
    else
      "."
    end
  end
end
