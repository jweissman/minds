require 'spec_helper'

describe "hidden_neuron_layers/index" do
  before(:each) do
    assign(:hidden_neuron_layers, [
      stub_model(HiddenNeuronLayer,
        :mind_id => 1,
        :neuron_count => 2,
        :position => 3
      ),
      stub_model(HiddenNeuronLayer,
        :mind_id => 1,
        :neuron_count => 2,
        :position => 3
      )
    ])
  end

  it "renders a list of hidden_neuron_layers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
