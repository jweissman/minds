require 'spec_helper'

describe "training_data/new" do
  before(:each) do
    assign(:training_datum, stub_model(TrainingDatum,
      :name => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new training_datum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => training_data_path, :method => "post" do
      assert_select "input#training_datum_name", :name => "training_datum[name]"
      assert_select "input#training_datum_description", :name => "training_datum[description]"
    end
  end
end
