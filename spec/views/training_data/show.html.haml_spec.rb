require 'spec_helper'

describe "training_data/show" do
  before(:each) do
    @training_datum = assign(:training_datum, stub_model(TrainingDatum,
      :name => "Name",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Description/)
  end
end
