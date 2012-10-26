require 'spec_helper'

describe "minds/edit" do
  before(:each) do
    @mind = assign(:mind, stub_model(Mind,
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit mind form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => minds_path(@mind), :method => "post" do
      assert_select "input#mind_name", :name => "mind[name]"
      assert_select "input#mind_description", :name => "mind[description]"
    end
  end
end
