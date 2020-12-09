class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @empty = true
  end

  def empty?
    @empty
  end

  def place_ship(ship)
    @empty = false
  end
end
