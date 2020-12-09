class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

  def empty?
    @ship.nil?
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    if ship.health == ship.length
      false
    else
      true
    end
  end

  def fire_upon
    ship.hit
  end

  def render
    if ship.nil? == true
      "."
    elsif fired_upon? == true && ship.nil? == false
      "M"
    elsif fired_upon? == true && ship.health == 0
      "X"
    else fired_upon? == true && ship.nil? == true
      "H"
    end
  end
end
