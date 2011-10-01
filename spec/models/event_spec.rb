require 'spec_helper'

describe Event do
  it "should order lectures from balance" do
    lecture1 = Lecture.make!(:positive_vote => 10, :negative_vote => 1)
    lecture2 = Lecture.make!(:positive_vote => 11, :negative_vote => 2)
    lecture3 = Lecture.make!(:positive_vote => 9,  :negative_vote => 0)
    eventy = Event.make!(:lectures => [lecture1, lecture2, lecture3])
    Event.find(eventy.id).lectures.should == [lecture3, lecture1, lecture2]
  end
end