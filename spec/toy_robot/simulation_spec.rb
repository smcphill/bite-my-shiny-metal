require 'spec_helper'

describe ToyRobot::Simulation do
  describe '#instruct' do
    let(:robot)       { ToyRobot::Robot.new }
    let(:table)       { ToyRobot::SquareTable.new }
    let(:parser)      { ToyRobot::InstructionParser.new }
    let(:request)     { nil }
    subject           { described_class.new robot: robot, table: table, parser: parser }
    let(:result)      { subject.instruct }
    before do
      allow(parser).to receive(:parse).and_return(request)
    end

    context 'with no instruction' do
      let(:request) { nil }

      it 'returns nil' do
        expect(result).to be nil
      end
    end

    context 'with a known instruction' do
      context 'report' do
        let(:request) { { command: :report } }

        context 'before the robot is placed' do
          it 'returns nil' do
            expect(result).to be nil
          end
        end

        context 'when the robot is placed' do
          let(:request) { { command: :report } }

          before do
            table.placement = { x: 2, y: 3}
            robot.bearing   = :south
          end

          it 'reports robot telemetry' do
            expect(result).to eq '2,3,SOUTH'
          end
        end
      end

      context 'place' do
        before do
          result
        end

        context 'when the move is unsafe' do
          let(:request) do
            {
              command:   :place,
              arguments: {
                coordinates: { x: 50, y: 10 },
                bearing:     :north
              }
            }
          end

          it 'does not place the robot on the table' do
            expect(table.placement).to be nil
          end
        end

        context 'when the move is safe' do
          let(:request) do
            {
              command:   :place,
              arguments: {
                coordinates: { x: 2, y: 3 },
                bearing:     :north
              }
            }
          end
          it 'places the robot on the table' do
            expect(table.placement).to eq({ x: 2, y: 3 })
          end

          it 'aligns the robot' do
            expect(robot.bearing).to be :north
          end
        end
      end

      context 'move' do
        let(:request)   { { command: :move } }
        let(:contains?) { nil }
        before do
          allow(robot).to receive(:move)
          allow(table).to receive(:contains?).and_return contains?
          result
        end

        context 'when the move is unsafe' do
          let(:contains?) { false }

          it 'does not instruct the robot to move' do
            expect(robot).not_to have_received(:move)
          end
        end

        context 'when the move is safe' do
          let(:contains?) { true }

          it 'does not instruct the robot' do
            expect(robot).not_to have_received(:move)
          end
        end
      end

      context 'left' do
        let(:request) { { command: :left } }

        before do
          allow(robot).to receive(:left)
        end

        context 'when the robot is placed' do
          before do
            table.placement = { x: 0, y: 0 }
            robot.bearing   = :north
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
        let(:request) { { command: :right } }

        before do
          allow(robot).to receive(:right)
        end

        context 'when the robot is placed' do
          before do
            table.placement = { x: 0, y: 0 }
            robot.bearing   = :north
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
