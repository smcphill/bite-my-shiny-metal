class Table
  def initialize
    @dimension = 5
  end

  def contains?(coordinates)
    return false unless coordinates[:x] && coordinates[:y]
    x = coordinates[:x]
    y = coordinates[:y]
    return false unless (x.is_a?(Integer) && y.is_a?(Integer))
    x < @dimension && y < @dimension
  end
end
