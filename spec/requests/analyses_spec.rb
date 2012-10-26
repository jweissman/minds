require 'spec_helper'

describe "Analyses" do
  describe "GET /analyses" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get analyses_path
      response.status.should be(200)
    end
  end
end
