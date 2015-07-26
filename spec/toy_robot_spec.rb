require 'spec_helper'

describe ToyRobot do
  describe '.simulate' do
    let(:lines) { [] }

    before do
      simulation = instance_double 'Simulation', :instruct
      input = double 'ARGF', each: lines
      output = instance_double '$stdout', :puts
    end

    context 'with an invalid instruction' do
      let(:lines) { ['SUDO MAKE ME A SANDWICH'] }
      it 'instructs the simulation' do
        expect(simulation).to have_received(:instruct).with('SUDO MAKE ME A SANDWICH')
      end

      it 'produce no output' do
        expect(output).not_to have_received(:puts)
      end
    end

    context 'with a valid instruction' do
      context 'PLACE...' do
        it 'instructs the simulation' do
        end

        it 'produce no output' do
        end
      end

      context 'REPORT' do
        it 'instructs the simulation' do
        end

        it 'outputs the simulation response' do
        end
      end

      context 'MOVE' do
        it 'instructs the simulation' do
        end

        it 'produce no output' do
        end
      end

      context 'LEFT' do
        it 'instructs the simulation' do
        end

        it 'produce no output' do
        end
      end

      context 'RIGHT' do
        it 'instructs the simulation' do
        end

        it 'produce no output' do
        end
      end
    end
  end
end
