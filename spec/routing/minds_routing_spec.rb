require "spec_helper"

describe MindsController do
  describe "routing" do

    it "routes to #index" do
      get("/minds").should route_to("minds#index")
    end

    it "routes to #new" do
      get("/minds/new").should route_to("minds#new")
    end

    it "routes to #show" do
      get("/minds/1").should route_to("minds#show", :id => "1")
    end

    it "routes to #edit" do
      get("/minds/1/edit").should route_to("minds#edit", :id => "1")
    end

    it "routes to #create" do
      post("/minds").should route_to("minds#create")
    end

    it "routes to #update" do
      put("/minds/1").should route_to("minds#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/minds/1").should route_to("minds#destroy", :id => "1")
    end

  end
end
