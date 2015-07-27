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
      let(:coordinates) { { x: 6, y: -1 } }
      it 'returns false' do
        expect(result).to be false
      end
    end
  end

  describe '#placed?' do
    context 'before a placement has been made' do
      it 'returns false' do
        expect(subject.placed?).to be false
      end
    end

    context 'when a placement has been made' do
      before do
        subject.place(x: 2, y: 3)
      end

      it 'returns true' do
        expect(subject.placed?).to be true
      end
    end
  end

  describe '#place' do
    before do
      subject.place(x: 2, y: 3)
    end

    it 'sets a placement at the provided coordinates' do
      expect(subject.placement).to eq(x: 2, y: 3)
    end
  end
end
