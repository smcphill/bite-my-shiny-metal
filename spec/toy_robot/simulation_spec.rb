require 'spec_helper'

describe ToyRobot::Simulation do
  describe '#instruct' do
    let(:robot)       { ToyRobot::Robot.new }
    let(:table)       { ToyRobot::SquareTable.new }
    let(:instruction) { nil }
    let(:result)      { subject.instruct instruction }

    before do
      allow(ToyRobot::Robot).to receive(:new).and_return(robot)
      allow(ToyRobot::SquareTable).to receive(:new).and_return(table)
    end

    context 'with an invalid instruction' do
      let(:instruction) { 'PLACE' }

      it 'returns nil' do
        expect(result).to be nil
      end
    end

    context 'with a valid instruction' do
      context 'report' do
        let(:instruction) { 'REPORT' }

        context 'before the robot is placed' do
          before do
            allow(table).to receive(:placed?).and_return(false)
          end

          it 'returns nil' do
            expect(result).to be nil
          end
        end

        context 'when the robot is placed' do
          before do
            subject.instruct 'PLACE 2,3,SOUTH'
          end

          it 'reports robot telemetry' do
            expect(result).to eq '2,3,SOUTH'
          end
        end
      end

      context 'place' do
        context 'when the move is unsafe' do
          let(:instruction) { 'PLACE 50,10,NORTH' }

          it 'returns nil' do
            expect(result).to be nil
          end
        end

        context 'when the move is safe' do
          let(:instruction) { 'PLACE 4,0,NORTH' }
          before do
            result
          end

          it 'places the robot on the table' do
            expect(table.placed?).to eq true
          end
        end
      end

      context 'move' do
        let(:instruction) { 'MOVE' }
        before do
          allow(robot).to receive(:move)
        end

        context 'when the move is unsafe' do
          before do
            allow(table).to receive(:contains?).and_return false
            result
          end

          it 'does not instruct the robot to move' do
            expect(robot).not_to have_received(:move)
          end
        end

        context 'when the move is safe' do
          before do
            allow(table).to receive(:contains?).and_return true
            result
          end

          it 'does not instruct the robot' do
            expect(robot).not_to have_received(:move)
          end
        end
      end

      context 'left' do
        let(:instruction) { 'LEFT' }
        before do
          allow(robot).to receive(:left)
        end

        context 'when the robot is placed' do
          before do
            subject.instruct 'PLACE 0,0,NORTH'
            result
          end

          it 'instructs the robot to turn left' do
            expect(robot).to have_received(:left)
          end
        end

        context 'when the robot is not placed' do
          before do
            allow(table).to receive(:placed?).and_return false
            result
          end

          it 'does not instruct the robot' do
            expect(robot).not_to have_received(:left)
          end
        end
      end

      context 'right' do
        let(:instruction) { 'RIGHT' }
        before do
          allow(robot).to receive(:right)
        end

        context 'when the robot is placed' do
          before do
            subject.instruct 'PLACE 0,0,NORTH'
            result
          end

          it 'instructs the robot to turn right' do
            expect(robot).to have_received(:right)
          end
        end

        context 'when the robot is not placed' do
          before do
            allow(table).to receive(:placed?).and_return false
            result
          end

          it 'does not instruct the robot' do
            expect(robot).not_to have_received(:right)
          end
        end
      end
    end
  end
end
