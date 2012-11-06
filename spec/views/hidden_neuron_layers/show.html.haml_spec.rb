require 'spec_helper'

describe "hidden_neuron_layers/show" do
  before(:each) do
    @hidden_neuron_layer = assign(:hidden_neuron_layer, stub_model(HiddenNeuronLayer,
      :mind_id => 1,
      :neuron_count => 2,
      :position => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
