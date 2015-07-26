require 'spec_helper'

describe ToyRobot::InstructionParser do
  describe '#parse' do
    let(:instruction) { '' }
    let(:result)      { subject.parse instruction }

    context 'when the command is not known' do
      it 'returns nil' do
        expect(result).to be nil
      end
    end

    context 'with a place command' do
      context 'with valid arguments' do
        let(:instruction) { 'PLACE 0,0,NORTH' }

        it 'returns a valid place request' do
          expected_request = {
            command:   :place,
            arguments: {
              bearing:     :north,
              coordinates: {
                x: 0,
                y: 0
              }
            }
          }
          expect(result).to eq expected_request
        end
      end

      context 'with malformed arguments' do
        let(:instruction) { 'PLACE 1' }

        it 'returns nil' do
          expect(result).to be nil
        end
      end
    end

    context 'when the command is known but not place' do
      let(:instruction) { 'REPORT' }

      context 'without arguments' do
        it 'returns a valid request' do
          expected_request = { command: :report }
          expect(result).to eq(expected_request)
        end
      end

      context 'with arguments' do
        let(:instruction) { 'MOVE 2,3,EAST' }

        it 'returns nil' do
          expect(result).to be nil
        end
      end
    end
  end
end
