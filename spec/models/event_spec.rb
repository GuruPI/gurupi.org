require 'spec_helper'

describe Event do

  it "should create slug" do
    eventy = Event.create(:name => "Event with name")
    eventy.slug.should == "event-with-name"
  end

  it "should order lectures from balance" do
    lectures = []
    lectures << Lecture.make!(:positive_vote => 10, :negative_vote => 1)
    lectures << Lecture.make!(:positive_vote => 11, :negative_vote => 2)
    lectures << Lecture.make!(:positive_vote => 9,  :negative_vote => 0)
    eventy = Event.make!(:lectures => lectures)
    Event.find(eventy.id).lectures.should == [lectures[2], lectures[0], lectures[1]]
  end

end
