require "spec_helper"

describe HiddenNeuronLayersController do
  describe "routing" do

    it "routes to #index" do
      get("/hidden_neuron_layers").should route_to("hidden_neuron_layers#index")
    end

    it "routes to #new" do
      get("/hidden_neuron_layers/new").should route_to("hidden_neuron_layers#new")
    end

    it "routes to #show" do
      get("/hidden_neuron_layers/1").should route_to("hidden_neuron_layers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/hidden_neuron_layers/1/edit").should route_to("hidden_neuron_layers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/hidden_neuron_layers").should route_to("hidden_neuron_layers#create")
    end

    it "routes to #update" do
      put("/hidden_neuron_layers/1").should route_to("hidden_neuron_layers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/hidden_neuron_layers/1").should route_to("hidden_neuron_layers#destroy", :id => "1")
    end

  end
end
