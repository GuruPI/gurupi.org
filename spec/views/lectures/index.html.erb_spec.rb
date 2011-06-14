require 'spec_helper'

describe "lectures/index.html.erb" do
  before(:each) do
    assign(:lectures, [
      stub_model(Lecture,
        :name => "Name",
        :description => "Description",
        :positive_vote => 1,
        :negative_vote => 1,
        :user_id => 1,
        :event_id => 1
      ),
      stub_model(Lecture,
        :name => "Name",
        :description => "Description",
        :positive_vote => 1,
        :negative_vote => 1,
        :user_id => 1,
        :event_id => 1
      )
    ])
  end

  it "renders a list of lectures" do
    render

    assert_select "tr>td", :text => "Name".to_s, :count => 2

    assert_select "tr>td", :text => "Description".to_s, :count => 2

    assert_select "tr>td", :text => 1.to_s, :count => 2

    assert_select "tr>td", :text => 1.to_s, :count => 2

    assert_select "tr>td", :text => 1.to_s, :count => 2

    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

