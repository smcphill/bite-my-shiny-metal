require 'spec_helper'

describe ToyRobot::Robot do
  describe '#step' do
    let(:aspect) { nil }
    let(:result) { subject.step }

    before do
      subject.alignment = aspect
    end

    context 'before being aligned' do
      it 'returns nil' do
        expect(result).to be nil
      end
    end

    context 'aligned west' do
      let(:aspect) { :west }

      it 'provides a delta (-1, 0)' do
        expect(result).to eq({ x: -1, y: 0 })
      end
    end

    context 'aligned south' do
      let(:aspect) { :south }

      it 'provides a delta (0, -1)' do
        expect(result).to eq({ x: 0, y: -1 })
      end
    end

    context 'aligned east' do
      let(:aspect) { :east }

      it 'provides a delta (+1, 0)' do
        expect(result).to eq({ x: 1, y: 0 })
      end
    end

    context 'aligned north' do
      let(:aspect) { :north }

      it 'provides a delta (0, +1)' do
        expect(result).to eq({ x: 0, y: 1 })
      end
    end
  end

  describe '#left' do
    let(:aspect) { :nil }
    let(:result) { subject.left }

    before do
      subject.alignment = aspect
    end

    context 'not aligned' do
      it 'returns nil' do
        expect(result).to be nil
      end
    end

    context 'aligned west' do
      let(:aspect) { :west }

      it 'faces south' do
        expect(result).to be :south
      end
    end

    context 'aligned south' do
      let(:aspect) { :south }

      it 'faces east' do
        expect(result).to be :east
      end
    end

    context 'aligned east' do
      let(:aspect) { :east }

      it 'faces north' do
        expect(result).to be :north
      end
    end

    context 'aligned north' do
      let(:aspect) { :north }

      it 'faces west' do
        expect(result).to be :west
      end
    end
  end

  describe '#right' do
    let(:aspect) { :nil }
    let(:result) { subject.right }

    before do
      subject.alignment = aspect
    end

    context 'not aligned' do
      it 'returns nil' do
        expect(result).to be nil
      end
    end

    context 'aligned west' do
      let(:aspect) { :west }

      it 'faces north' do
        expect(result).to be :north
      end
    end

    context 'aligned south' do
      let(:aspect) { :south }

      it 'faces west' do
        expect(result).to be :west
      end
    end

    context 'aligned east' do
      let(:aspect) { :east }

      it 'faces south' do
        expect(result).to be :south
      end
    end

    context 'aligned north' do
      let(:aspect) { :north }

      it 'faces east' do
        expect(result).to be :east
      end
    end
  end
end
