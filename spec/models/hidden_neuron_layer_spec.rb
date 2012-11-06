require 'spec_helper'

describe HiddenNeuronLayer do
  context "has a working factory" do
    describe "when created without options" do
      subject { FactoryGirl.create(:hidden_neuron_layer) }
      its(:neuron_count) { should_not be_nil }
      its(:neuron_count) { should be_a Numeric }
    end

    context "when provided position" do
      let(:position) { 3 }
      subject do
        FactoryGirl.create(
            :hidden_neuron_layer,
            :position => position
        )
      end
      describe "and given a position of 3" do
        its(:position) { should eql(position) }
      end
    end
  end

end
