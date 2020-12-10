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
      # ship.health == ship.length
      # false
    # else
    #   true
    # end
  end

  def fire_upon
    # require "pry"; binding.pry
    if ship.nil? == true
      @fired_upon = true
    else ship.hit
      @fired_upon = true
    end
  end

  def render
    # require "pry"; binding.pry
    if ship.nil? == false && ship.sunk? == true
      "X"
    elsif (@fired_upon == true) && empty? == true
      "M"
    elsif @fired_upon == true && ship.nil? == true
      "H"
    else
      "."
    end
  end
end
