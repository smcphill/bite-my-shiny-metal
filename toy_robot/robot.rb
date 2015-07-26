module ToyRobot
  class Robot
    attr_accessor :bearing

    def left
      @bearing = {
        north: :west,
        south: :east,
        east: :north,
        west: :south
      }[@bearing]
    end

    def right
      @bearing = {
        north: :east,
        south: :west,
        east: :south,
        west: :north
      }[@bearing]
    end

    def step
      {
        north: { x: 0,  y: 1  },
        west:  { x: -1, y: 0  },
        south: { x: 0,  y: -1 },
        east:  { x: 1,  y: 0  }
      }[@bearing]
    end
  end
end
