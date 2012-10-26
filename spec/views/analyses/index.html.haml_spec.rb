require 'spec_helper'

describe "analyses/index" do
  before(:each) do
    assign(:analyses, [
      stub_model(Analysis,
        :inputs => "MyText",
        :output => "MyText",
        :mind_id => ""
      ),
      stub_model(Analysis,
        :inputs => "MyText",
        :output => "MyText",
        :mind_id => ""
      )
    ])
  end

  it "renders a list of analyses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
