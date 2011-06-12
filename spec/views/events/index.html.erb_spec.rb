require 'spec_helper'

describe "events/index.html.erb" do
  before(:each) do
    assign(:events, [
      stub_model(Event,
        :name => "Name",
        :description => "MyText",
        :hour => "Hour",
        :place => "Place",
        :slug => "Slug"
      ),
      stub_model(Event,
        :name => "Name",
        :description => "MyText",
        :hour => "Hour",
        :place => "Place",
        :slug => "Slug"
      )
    ])
  end

  it "renders a list of events" do
    render

    assert_select "tr>td", :text => "Name".to_s, :count => 2

    assert_select "tr>td", :text => "MyText".to_s, :count => 2

    assert_select "tr>td", :text => "Hour".to_s, :count => 2

    assert_select "tr>td", :text => "Place".to_s, :count => 2

    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end

