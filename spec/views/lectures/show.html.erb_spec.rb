require 'spec_helper'

describe "lectures/show.html.erb" do
  before(:each) do
    @lecture = assign(:lecture, stub_model(Lecture,
      :name => "Name",
      :description => "Description",
      :positive_vote => 1,
      :negative_vote => 1,
      :user_id => 1,
      :event_id => 1,
      :slug => "MyString"
    ))
  end

  it "renders attributes in <p>" do
    render

    rendered.should match(/Name/)

    rendered.should match(/Description/)

    rendered.should match(/1/)

    rendered.should match(/1/)

    rendered.should match(/1/)

    rendered.should match(/1/)
  end
end

