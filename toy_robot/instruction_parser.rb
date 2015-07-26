module ToyRobot
  class InstructionParser
    def parse(instruction)
      (command, arguments) = instruction.split ' '
      request = {}
      request[:command]   = symbolize command
      request[:arguments] = parse_arguments arguments if arguments
      request if valid_instruction?(request)
    end

    private

    def valid_instruction?(request)
      valid_command = COMMANDS.include?(request[:command])
      if request[:command] == :place
        valid_arguments = request.key?(:arguments) && valid_arguments?(request[:arguments])
      else
        valid_arguments = !request.key?(:arguments)
      end

      valid_command && valid_arguments
    end

    def valid_arguments?(arguments)
      (
        BEARINGS.include?(arguments[:bearing]) &&
        valid_coordinates?(arguments[:coordinates])
      )
    end

    def valid_coordinates?(coordinates)
      (
        coordinates[:x].is_a?(Integer) &&
        coordinates[:y].is_a?(Integer)
      )
    end

    def parse_arguments(arguments)
      (x, y, bearing) = arguments.split ','
      arguments = {}
      arguments[:bearing]         = symbolize bearing
      arguments[:coordinates]     = {}
      arguments[:coordinates][:x] = parse_numeric x
      arguments[:coordinates][:y] = parse_numeric y
      arguments
    end

    def parse_numeric(input)
      Integer input
    rescue
      nil
    end

    def symbolize(input)
      "#{input}".downcase.to_sym
    end
  end
end
