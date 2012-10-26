require "spec_helper"

describe AnalysesController do
  describe "routing" do

    it "routes to #index" do
      get("/analyses").should route_to("analyses#index")
    end

    it "routes to #new" do
      get("/analyses/new").should route_to("analyses#new")
    end

    it "routes to #show" do
      get("/analyses/1").should route_to("analyses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/analyses/1/edit").should route_to("analyses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/analyses").should route_to("analyses#create")
    end

    it "routes to #update" do
      put("/analyses/1").should route_to("analyses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/analyses/1").should route_to("analyses#destroy", :id => "1")
    end

  end
end
