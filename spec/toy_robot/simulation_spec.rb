require 'spec_helper'

describe ToyRobot::Simulation do
  describe '#instruct' do
    let(:instruction) { '' }
    let(:result) do
      subject.instruct instruction
      subject.instruct 'REPORT'
    end

    context 'with an invalid instruction' do
      let(:instruction) { 'MAKE ME A SANDWICH' }

      it 'returns nil' do
        expect(result).to be nil
      end
    end

    context 'with a valid instruction' do
      context 'place' do
        context 'when the move is unsafe' do
          let(:instruction) { 'PLACE 50,10,NORTH' }

          it 'returns nil' do
            expect(result).to be nil
          end
        end

        context 'when the move is safe' do
          let(:instruction) { 'PLACE 4,0,NORTH' }

          it 'places the robot' do
            expect(result).to eq '4,0,NORTH'
          end
        end
      end

      context 'report' do
        context 'before the robot is placed' do
          it 'returns nil' do
            expect(result).to be nil
          end
        end

        context 'when the robot is placed' do
          let(:instruction) { 'PLACE 2,3,SOUTH' }

          it 'reports robot telemetry' do
            expect(result).to eq '2,3,SOUTH'
          end
        end
      end

      context 'move' do
        let(:instruction) { 'MOVE' }

        context 'when the move is unsafe' do
          before do
            subject.instruct 'PLACE 2,0,SOUTH'
          end

          it 'does not move' do
            expect(result).to eq '2,0,SOUTH'
          end
        end

        context 'when the move is safe' do
          before do
            subject.instruct 'PLACE 2,3,SOUTH'
          end

          it 'moves' do
            expect(result).to eq '2,2,SOUTH'
          end
        end
      end

      context 'left' do
        let(:instruction) { 'LEFT' }

        context 'when the robot is placed' do
          before do
            subject.instruct 'PLACE 2,3,SOUTH'
          end

          it 'turns the robot 90º to the left' do
            expect(result).to eq '2,3,EAST'
          end
        end
      end

      context 'right' do
        let(:instruction) { 'RIGHT' }

        context 'when the robot is placed' do
          before do
            subject.instruct 'PLACE 2,3,SOUTH'
          end

          it 'turns the robot 90º to the right' do
            expect(result).to eq '2,3,WEST'
          end
        end
      end
    end
  end
end
