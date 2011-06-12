require 'spec_helper'

describe "events/edit.html.erb" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :name => "MyString",
      :description => "MyText",
      :hour => "MyString",
      :place => "MyString",
      :slug => "MyString"
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form", :action => events_path(@event), :method => "post" do
      assert_select "input#event_name", :name => "event[name]"
      assert_select "textarea#event_description", :name => "event[description]"
      assert_select "input#event_hour", :name => "event[hour]"
      assert_select "input#event_place", :name => "event[place]"
      assert_select "input#event_slug", :name => "event[slug]"
    end
  end
end

