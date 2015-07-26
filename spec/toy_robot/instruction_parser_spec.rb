require 'spec_helper'

describe ToyRobot::InstructionParser do
  describe '#parse' do
    let(:instruction) { '' }
    let(:result)      { subject.parse instruction }

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

      context 'without arguments' do
        let(:instruction) { 'PLACE' }

        it 'returns nil' do
          expect(result).to be nil
        end
      end

      context 'with an invalid bearing' do
        let(:instruction) { 'PLACE 0,0,NORTHWEST' }

        it 'returns nil' do
          expect(result).to be nil
        end
      end

      context 'with invalid coordinates' do
        let(:instruction) { 'PLACE 10,DOG,NORTH' }

        it 'returns nil' do
          expect(result).to be nil
        end
      end
    end

    context 'when the command is known but not place' do
      context 'with arguments' do
        it 'returns nil' do
          expect(result).to be nil
        end
      end

      context 'without arguments' do
        it 'returns a valid request'
      end
    end

    context 'when the command is not known' do
      it 'returns nil' do
        expect(result).to be nil
      end
    end
  end
end
