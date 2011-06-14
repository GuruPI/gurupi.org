require 'spec_helper'

describe "events/show.html.erb" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :name => "Name",
      :description => "MyText",
      :hour => "Hour",
      :place => "Place",
      :slug => "Slug",
      :event_date => Date.today
    ))
  end

  it "renders attributes in <p>" do
    render

    rendered.should match(/Name/)

    rendered.should match(/MyText/)

    rendered.should match(/Event date/)

    rendered.should match(/Hour/)

    rendered.should match(/Place/)

  end
end

