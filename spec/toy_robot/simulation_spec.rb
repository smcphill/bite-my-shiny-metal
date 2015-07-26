require 'spec_helper'

describe ToyRobot::Simulation do
  describe '#instruct' do
    let(:instruction) { nil }
    let(:options) { nil }
    let(:result) { subject.instruct(instruction) }

    context 'with an invalid instruction' do
      let(:instruction) { 'MAKE ME A SANDWICH' }

      it 'returns nil' do
        expect(result).to be nil
      end
    end

    context 'with a valid instruction' do
      context 'place' do
        context 'when the move is unsafe' do
        end

        context 'when the move is safe' do
        end
      end

      context 'report' do
        let(:instruction) { 'REPORT' }
        context 'when the robot is placed' do
          before do
            subject.instruct 'PLACE 2,3,SOUTH'
          end

          it 'reports robot telemetry' do
            expect(result).to eq '2,3,SOUTH'
          end
        end

        context 'before the robot is placed' do
          it 'returns nil' do
            expect(result).to be nil
          end
        end
      end

      context 'move' do
        let(:instruction) { 'MOVE' }
        let(:result) { subject.instruct 'REPORT' }

        context 'when the move is unsafe' do
          before do
            subject.instruct 'PLACE 2,0,SOUTH'
          end
        end

        context 'when the move is safe' do
          before do
            subject.instruct 'PLACE 2,3,SOUTH'
          end
        end
      end

      context 'left' do
        let(:instruction) { 'LEFT' }
        let(:result) { subject.instruct 'REPORT' }

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
        let(:result) { subject.instruct 'REPORT' }

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
