require 'spec_helper'

describe Table do
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
end
