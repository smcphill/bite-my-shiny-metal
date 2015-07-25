  class Robot

    attr_accessor :alignment

    def left
      @alignment = {
        north: :west,
        south: :east,
        east: :north,
        west: :south
      }[@alignment]
    end

    def right
      @alignment = {
        north: :east,
        south: :west,
        east: :south,
        west: :north
      }[@alignment]
    end

    def step
      {
        north: {
          x: 0,
          y: 1
        },
        west:  {
          x: -1,
          y: 0
        },
        south: {
          x: 0,
          y: -1
        },
        east:  {
          x: 1,
          y: 0
        }
      }[@alignment]
    end
  end
