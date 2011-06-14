require 'spec_helper'

describe "lectures/edit.html.erb" do
  before(:each) do
    @lecture = assign(:lecture, stub_model(Lecture,
      :name => "MyString",
      :description => "MyString",
      :positive_vote => 1,
      :negative_vote => 1,
      :user_id => 1,
      :event_id => 1
    ))
  end

  it "renders the edit lecture form" do
    render

    assert_select "form", :action => lectures_path(@lecture), :method => "post" do
      assert_select "input#lecture_name", :name => "lecture[name]"
      assert_select "input#lecture_description", :name => "lecture[description]"
      assert_select "input#lecture_positive_vote", :name => "lecture[positive_vote]"
      assert_select "input#lecture_negative_vote", :name => "lecture[negative_vote]"
      assert_select "input#lecture_user_id", :name => "lecture[user_id]"
      assert_select "input#lecture_event_id", :name => "lecture[event_id]"
    end
  end
end

