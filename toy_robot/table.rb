class Table
  def initialize
    @dimension = 5
  end

  def contains?(coordinates)
    coordinates[:x] < @dimension && coordinates[:y] < @dimension
  end
end
