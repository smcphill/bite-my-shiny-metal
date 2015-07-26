require 'spec_helper'

describe ToyRobot::SquareTable do
  describe '#contains?' do
    let(:coordinates) { { x: 0, y: 0 } }
    let(:result)      { subject.contains?(coordinates) }

    context 'when bounded coordinates are supplied' do
      it 'returns true' do
        expect(result).to be true
      end
    end

    context 'when unbounded coordinates are supplied' do
      let(:coordinates) { { x: 6, y: -1} }
      it 'returns false' do
        expect(result).to be false
      end
    end
  end

  describe '#placed?' do
    context 'when a placement has been made' do
      before do
        subject.placement = :north
      end

      it 'returns true' do
        expect(subject.placed?).to be true
      end
    end

    context 'before a placement has been made' do
      it 'returns false' do
        expect(subject.placed?).to be false
      end
    end
  end
end
