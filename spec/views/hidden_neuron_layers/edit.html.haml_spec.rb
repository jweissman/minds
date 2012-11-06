require 'spec_helper'

describe "hidden_neuron_layers/edit" do
  before(:each) do
    @hidden_neuron_layer = assign(:hidden_neuron_layer, stub_model(HiddenNeuronLayer,
      :mind_id => 1,
      :neuron_count => 1,
      :position => 1
    ))
  end

  it "renders the edit hidden_neuron_layer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hidden_neuron_layers_path(@hidden_neuron_layer), :method => "post" do
      assert_select "input#hidden_neuron_layer_mind_id", :name => "hidden_neuron_layer[mind_id]"
      assert_select "input#hidden_neuron_layer_neuron_count", :name => "hidden_neuron_layer[neuron_count]"
      assert_select "input#hidden_neuron_layer_position", :name => "hidden_neuron_layer[position]"
    end
  end
end
