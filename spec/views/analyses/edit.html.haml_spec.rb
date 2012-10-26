require 'spec_helper'

describe "analyses/edit" do
  before(:each) do
    @analysis = assign(:analysis, stub_model(Analysis,
      :inputs => "MyText",
      :output => "MyText",
      :mind_id => ""
    ))
  end

  it "renders the edit analysis form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => analyses_path(@analysis), :method => "post" do
      assert_select "textarea#analysis_inputs", :name => "analysis[inputs]"
      assert_select "textarea#analysis_output", :name => "analysis[output]"
      assert_select "input#analysis_mind_id", :name => "analysis[mind_id]"
    end
  end
end
