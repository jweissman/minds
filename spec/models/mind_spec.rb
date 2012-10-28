require 'spec_helper'

describe Mind do
  #pending "add some examples to (or delete) #{__FILE__}"

  def sample(inp, out)
    FactoryGirl.create(:training_datum, :input => inp, :expected_output => out)
  end

  context "generating predictions" do
    subject { Mind.new }
    let(:training_data) {
      [
        [0.8,0.9,1.0] => 0.9,
        [0.4,0.5,0.6] => 0.5,
        [0.3,0.4,0.5] => 0.4,
        [0.1,0.3,0.5] => 0.3
      ]
    }

    before(:each) do
      training_data.each do |(k,v)|
        subject.training_data << sample(k,v)
      end
      #subject.training_data = training_data
      subject.train!
    end

    it "should learn a simple mean" do
      #subject.analyze([0.4,0.6,0.8]).should == 0.6
    end
  end

end
