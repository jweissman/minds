require 'spec_helper'

describe "training_data/edit" do
  before(:each) do
    @training_datum = assign(:training_datum, stub_model(TrainingDatum,
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit training_datum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => training_data_path(@training_datum), :method => "post" do
      assert_select "input#training_datum_name", :name => "training_datum[name]"
      assert_select "input#training_datum_description", :name => "training_datum[description]"
    end
  end
end
