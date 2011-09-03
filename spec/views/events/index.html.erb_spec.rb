require 'spec_helper'

describe "events/index.html.erb" do
  before(:each) do
    assign(:events, [
      stub_model(Event,
        :name => "Name",
        :description => "MyText",
        :hour => "Hour",
        :place => "Place",
        :slug => "Slug",
        :event_date => Date.today
      ),
      stub_model(Event,
        :name => "Name",
        :description => "MyText",
        :hour => "Hour",
        :place => "Place",
        :slug => "Slug",
        :event_date => Date.today
      )
    ])
  end

  it "renders a list of events" do
    render

    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Place".to_s, :count => 2
  end
end

