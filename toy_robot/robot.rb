  class Robot
    def initialize
      @placed = false
      @orientation = nil
    end

    def left
      @orientation = {
        north: :west,
        south: :east,
        east: :north,
        west: :south
      }[@orientation]
    end

    def right
      @orientation = {
        north: :east,
        south: :west,
        east: :south,
        west: :north
      }[@orientation]
    end

    def move(starting_from)
      {
        north: {
          x: starting_from[:x],
          y: starting_from[:y] + 1
        },
        west:  {
          x: starting_from[:x] - 1,
          y: starting_from[:y]
        },
        south: {
          x: starting_from[:x],
          y: starting_from[:y] - 1
        },
        east:  {
          x: starting_from[:x] + 1,
          y: starting_from[:y]
        }
      }[@orientation]
    end

    def placed?
      @placed
    end

    def place(aspect)
      @placed = true
      @orientation = aspect
    end

    def bearing
      return nil unless placed?
      @orientation
    end
  end
