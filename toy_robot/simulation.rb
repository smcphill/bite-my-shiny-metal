module ToyRobot
  class Simulation
    def initialize
      @table = SquareTable.new
      @robot = Robot.new
      @parser = InstructionParser.new
    end

    def instruct(instruction)
      request = @parser.parse instruction
      return unless request
      return place request[:arguments] if request[:command] == :place
      send request[:command] if @table.placed?
    end

    private

    def place(coordinates: nil, bearing: nil)
      return unless @table.contains?(coordinates)

      @table.placement = coordinates
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
      @table.placement = outcome if @table.contains?(outcome)

      nil
    end
  end
end
