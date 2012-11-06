require 'spec_helper'

describe "hidden_neuron_layers/new" do
  before(:each) do
    assign(:hidden_neuron_layer, stub_model(HiddenNeuronLayer,
      :mind_id => 1,
      :neuron_count => 1,
      :position => 1
    ).as_new_record)
  end

  it "renders new hidden_neuron_layer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hidden_neuron_layers_path, :method => "post" do
      assert_select "input#hidden_neuron_layer_mind_id", :name => "hidden_neuron_layer[mind_id]"
      assert_select "input#hidden_neuron_layer_neuron_count", :name => "hidden_neuron_layer[neuron_count]"
      assert_select "input#hidden_neuron_layer_position", :name => "hidden_neuron_layer[position]"
    end
  end
end
