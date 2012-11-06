require 'spec_helper'

describe TrainingDatum do
  context "has a working factory" do
    describe "when created without options" do
      subject { FactoryGirl.create(:training_datum) }
      its(:name) { should_not be_empty }
      its(:description) { should_not be_empty }
    end
    context "when provided inputs and outputs" do
      let(:input) { [0.1,0.4,0.5] }
      let(:output) { [0.7] }
      subject do
        FactoryGirl.create(
          :training_datum,
          :input => input,
          :expected_output => output
        )
      end
      describe "and given [0.1,0.4,0.5] => [0.7]" do
        its(:input) { should eql(input) }
        its(:expected_output) { should eql(output) }
      end
    end
  end

  # TODO other things
end