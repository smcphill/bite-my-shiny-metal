#!/usr/bin/env ruby

require 'robot'
require 'square_table'
require 'instruction_parser'
require 'simulation'

module ToyRobot
  COMMANDS = %i(place report move left right)
  BEARINGS = %i(north south east west)

  module_function

  def simulate(input: ARGF, output: $stdout)
    simulation = Simulation.new
    input.each do |line|
      response = simulation.instruct line
      output.puts response if response
    end
  end
end

ToyRobot.simulate if __FILE__ == $PROGRAM_NAME
