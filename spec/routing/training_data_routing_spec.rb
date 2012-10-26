require "spec_helper"

describe TrainingDataController do
  describe "routing" do

    it "routes to #index" do
      get("/training_data").should route_to("training_data#index")
    end

    it "routes to #new" do
      get("/training_data/new").should route_to("training_data#new")
    end

    it "routes to #show" do
      get("/training_data/1").should route_to("training_data#show", :id => "1")
    end

    it "routes to #edit" do
      get("/training_data/1/edit").should route_to("training_data#edit", :id => "1")
    end

    it "routes to #create" do
      post("/training_data").should route_to("training_data#create")
    end

    it "routes to #update" do
      put("/training_data/1").should route_to("training_data#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/training_data/1").should route_to("training_data#destroy", :id => "1")
    end

  end
end
