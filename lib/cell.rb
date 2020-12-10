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

  def render(option = false)
    # require "pry"; binding.pry
    if @ship && option == true
      # require "pry"; binding.pry
      "S"
    elsif @fired_upon == false
      "."
    elsif (@fired_upon == true) && empty? == true
      "M"
    elsif @fired_upon == true && empty? == false
      "H"
    else
      "X"
    end
    #

    # if @ship && option == true
    #   "S"
    # elsif ship.nil? == false && ship.sunk? == true
    #   "X"
    # elsif (@fired_upon == true) && empty? == true
    #   "M"
    # elsif @fired_upon == true && empty? == false
    #   "H"
    # else @fired_upon == false
    #   "."
    # end
  end
end
