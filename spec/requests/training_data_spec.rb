require 'spec_helper'

describe "TrainingData" do
  describe "GET /training_data" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get training_data_path
      response.status.should be(200)
    end
  end
end
