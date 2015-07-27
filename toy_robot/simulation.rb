module ToyRobot
  class Simulation
    def initialize(robot: Robot.new, table: SquareTable.new, parser: InstructionParser.new)
      @robot = robot
      @table = table
      @parser = parser
    end

    def instruct(instruction=nil)
      request = @parser.parse instruction
      return unless request
      return place request[:arguments] if request[:command] == :place
      send request[:command] if @table.placed?
    end

    private

    def place(coordinates: nil, bearing: nil)
      return unless @table.contains?(coordinates)

      @table.place coordinates
      @robot.bearing = bearing

      nil
    end

    def report
      return unless @table.placed?
      position = @table.placement

      "#{position[:x]},#{position[:y]},#{@robot.bearing}".upcase
    end

    def left
      return unless @table.placed?
      @robot.left

      nil
    end

    def right
      return unless @table.placed?
      @robot.right

      nil
    end

    def move
      return unless @table.placed?
      current = @table.placement
      outcome = current.merge(@robot.move) { |_key, pos, delta| pos + delta }
      @table.place outcome if @table.contains?(outcome)

      nil
    end
  end
end
