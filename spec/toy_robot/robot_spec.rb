require 'spec_helper'

describe Robot do
  describe '#placed?' do
    context 'when the robot is placed' do
      before do
        subject.place :north
      end

      it 'returns true' do
        expect(subject.placed?).to be true
      end
    end

    context 'when the robot is not placed' do
      it 'returns false' do
        expect(subject.placed?).to be false
      end
    end
  end

  describe '#place' do
    context 'with a valid bearing' do
      before do
        subject.place :south
      end

      it 'places the robot' do
        expect(subject.placed?).to be true
      end

      it 'orients the robot in the requested bearing' do
        expect(subject.bearing).to be :south
      end
    end

    context 'with an invalid bearing' do
      before do
        subject.place :north_pole
      end

      it 'does not place the robot' do
        expect(subject.placed?).to be false
      end
    end
  end

  describe '#bearing' do
    context 'when the robot is not placed' do
      it 'returns nil' do
        expect(subject.bearing).to be nil
      end
    end

    context 'when the robot is placed' do
      before do
        subject.place :north
      end

      it "returns the robot's bearing" do
        expect(subject.bearing).to be :north
      end
    end
  end

  describe '#move' do
    let(:position) { { x: 0, y: 0 } }
    let(:result)   { subject.move(position) }
    before do
      subject.place aspect
    end

    context 'when the robot is not placed' do
      let(:aspect) { nil }

      it 'returns nil' do
        expect(result).to be nil
      end
    end

    context 'facing west' do
      let(:aspect) { :west }

      it 'provides a delta (-1, 0)' do
        expect(result).to eq({ x: -1, y: 0 })
      end
    end

    context 'facing south' do
      let(:aspect) { :south }

      it 'provides a delta (0, -1)' do
        expect(result).to eq({ x: 0, y: -1 })
      end
    end

    context 'facing east' do
      let(:aspect) { :east }

      it 'provides a delta (+1, 0)' do
        expect(result).to eq({ x: 1, y: 0 })
      end
    end

    context 'facing north' do
      let(:aspect) { :north }

      it 'provides a delta (0, +1)' do
        expect(result).to eq({ x: 0, y: 1 })
      end
    end
  end

  describe '#left' do
    let(:aspect) { :north }
    let(:result) do
      subject.left
      subject.bearing
    end

    before do
      subject.place aspect
    end

    context 'when the robot is not placed' do
      let(:aspect) { nil }

      it 'returns nil' do
        expect(result).to be nil
      end
    end

    context 'facing west' do
      let(:aspect) { :west }

      it 'faces south' do
        expect(result).to be :south
      end
    end

    context 'facing south' do
      let(:aspect) { :south }

      it 'faces east' do
        expect(result).to be :east
      end
    end

    context 'facing east' do
      let(:aspect) { :east }

      it 'faces north' do
        expect(result).to be :north
      end
    end

    context 'facing north' do
      let(:aspect) { :north }

      it 'faces west' do
        expect(result).to be :west
      end
    end
  end

  describe '#right' do
    let(:aspect) { :north }
    let(:result) do
      subject.right
      subject.bearing
    end

    before do
      subject.place aspect
    end

    context 'when the robot is not placed' do
      let(:aspect) { nil }

      it 'returns nil' do
        expect(result).to be nil
      end
    end

    context 'facing west' do
      let(:aspect) { :west }

      it 'faces north' do
        expect(result).to be :north
      end
    end

    context 'facing south' do
      let(:aspect) { :south }

      it 'faces west' do
        expect(result).to be :west
      end
    end

    context 'facing east' do
      let(:aspect) { :east }

      it 'faces south' do
        expect(result).to be :south
      end
    end

    context 'facing north' do
      let(:aspect) { :north }

      it 'faces east' do
        expect(result).to be :east
      end
    end
  end
end
