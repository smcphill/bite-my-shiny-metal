require 'spec_helper'

describe ToyRobot::Robot do
  describe '#move' do
    let(:bearing) { nil }
    let(:result)  { subject.move }

    before do
      subject.bearing = bearing
    end

    context 'with no bearing' do
      it 'returns nil' do
        expect(result).to be nil
      end
    end

    context 'when bearing west' do
      let(:bearing) { :west }

      it 'provides a delta (-1, 0)' do
        expect(result).to eq x: -1, y: 0
      end
    end

    context 'when bearing south' do
      let(:bearing) { :south }

      it 'provides a delta (0, -1)' do
        expect(result).to eq x: 0, y: -1
      end
    end

    context 'when bearing east' do
      let(:bearing) { :east }

      it 'provides a delta (+1, 0)' do
        expect(result).to eq x: 1, y: 0
      end
    end

    context 'when bearing north' do
      let(:bearing) { :north }

      it 'provides a delta (0, +1)' do
        expect(result).to eq x: 0, y: 1
      end
    end
  end

  describe '#left' do
    let(:bearing) { :nil }
    let(:result) { subject.left }

    before do
      subject.bearing = bearing
    end

    context 'with no bearing' do
      it 'returns nil' do
        expect(result).to be nil
      end
    end

    context 'when bearing west' do
      let(:bearing) { :west }

      it 'faces south' do
        expect(result).to be :south
      end
    end

    context 'when bearing south' do
      let(:bearing) { :south }

      it 'faces east' do
        expect(result).to be :east
      end
    end

    context 'when bearing east' do
      let(:bearing) { :east }

      it 'faces north' do
        expect(result).to be :north
      end
    end

    context 'when bearing north' do
      let(:bearing) { :north }

      it 'faces west' do
        expect(result).to be :west
      end
    end
  end

  describe '#right' do
    let(:bearing) { :nil }
    let(:result)  { subject.right }

    before do
      subject.bearing = bearing
    end

    context 'with no bearing' do
      it 'returns nil' do
        expect(result).to be nil
      end
    end

    context 'when bearing west' do
      let(:bearing) { :west }

      it 'faces north' do
        expect(result).to be :north
      end
    end

    context 'when bearing south' do
      let(:bearing) { :south }

      it 'faces west' do
        expect(result).to be :west
      end
    end

    context 'when bearing east' do
      let(:bearing) { :east }

      it 'faces south' do
        expect(result).to be :south
      end
    end

    context 'when bearing north' do
      let(:bearing) { :north }

      it 'faces east' do
        expect(result).to be :east
      end
    end
  end
end
