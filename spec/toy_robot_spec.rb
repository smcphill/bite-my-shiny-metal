require 'spec_helper'

describe ToyRobot do
  describe '.simulate' do
    let(:lines)      { nil }
    let(:input)      { StringIO.new }
    let(:output)     { StringIO.new }
    let(:simulation) { ToyRobot::Simulation.new }
    let(:result)     { described_class.simulate input: lines, output: output }

    before do
      allow(input).to receive(:each).and_return(lines)
      allow(output).to receive(:puts)
      allow(simulation).to receive(:instruct).and_call_original
      allow(ToyRobot::Simulation).to receive(:new).and_return(simulation)
      result
    end

    context 'with empty input' do
      let(:lines) { [] }

      it "doesn't instruct the simulation" do
        expect(simulation).not_to have_received(:instruct)
      end

      it 'outputs nothing' do
        expect(output).not_to have_received(:puts)
      end
    end

    context 'with invalid input' do
      let(:lines) { ['PLACE 1'] }

      it 'instructs the simulation' do
        expect(simulation).to have_received(:instruct)
      end

      it 'outputs nothing' do
        expect(output).not_to have_received(:puts)
      end
    end

    context 'with input including PLACE and REPORT commands' do
      let(:lines) { ['PLACE 0,0,EAST', 'REPORT'] }

      it 'outputs any simulation response' do
        expect(output).to have_received(:puts).with('0,0,EAST')
      end
    end

    context 'with valid input not including a REPORT command' do
      let(:lines) { ['PLACE 0,0,EAST', 'MOVE'] }

      it 'outputs nothing' do
        expect(output).not_to have_received(:puts)
      end
    end
  end
end
