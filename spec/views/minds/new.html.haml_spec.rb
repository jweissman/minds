require 'spec_helper'

describe "minds/new" do
  before(:each) do
    assign(:mind, stub_model(Mind,
      :name => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new mind form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => minds_path, :method => "post" do
      assert_select "input#mind_name", :name => "mind[name]"
      assert_select "input#mind_description", :name => "mind[description]"
    end
  end
end
