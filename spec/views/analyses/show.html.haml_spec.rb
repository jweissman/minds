require 'spec_helper'

describe "analyses/show" do
  before(:each) do
    @analysis = assign(:analysis, stub_model(Analysis,
      :inputs => "MyText",
      :output => "MyText",
      :mind_id => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(//)
  end
end
