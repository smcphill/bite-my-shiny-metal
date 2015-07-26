module ToyRobot
  class SquareTable
    attr_accessor :placement

    def initialize
      dimension = 5
      @bounds = (0..dimension - 1)
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
