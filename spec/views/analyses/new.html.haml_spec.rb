require 'spec_helper'

describe "analyses/new" do
  before(:each) do
    assign(:analysis, stub_model(Analysis,
      :inputs => "MyText",
      :output => "MyText",
      :mind_id => ""
    ).as_new_record)
  end

  it "renders new analysis form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => analyses_path, :method => "post" do
      assert_select "textarea#analysis_inputs", :name => "analysis[inputs]"
      assert_select "textarea#analysis_output", :name => "analysis[output]"
      assert_select "input#analysis_mind_id", :name => "analysis[mind_id]"
    end
  end
end
