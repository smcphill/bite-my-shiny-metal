module ToyRobot
  class SquareTable
    attr_reader :placement

    def initialize
      dimension = 5
      @bounds = (0..dimension - 1)
    end

    def place(coordinates)
      @placement = coordinates
    end

    def placed?
      !!@placement
    end

    def contains?(coordinates)
      (
        @bounds.include?(coordinates[:x]) &&
        @bounds.include?(coordinates[:y])
      )
    end
  end
end
