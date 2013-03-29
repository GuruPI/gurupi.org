require 'spec_helper'

describe Event do
  before do
    @eventy = Event.create(:name => "Event with name", :event_date => Date.current)
    @user = User.make!(:identities => [Identity.make!])
  end
  
  it "should create slug" do
    @eventy.slug.should == "event-with-name"
  end

  it "should order lectures from balance" do
    lecture1 = Lecture.make!(:positive_vote => 10, :negative_vote => 1)
    lecture2 = Lecture.make!(:positive_vote => 11, :negative_vote => 2)
    lecture3 = Lecture.make!(:positive_vote => 9,  :negative_vote => 0)
    eventy = Event.make!(:lectures => [lecture1, lecture2, lecture3])
    Event.find(eventy.id).lectures.should == [lecture3, lecture1, lecture2]
  end
  
  it "should user go to the event" do
    @certificate = Certificate.create(:event => @eventy, :user => @user, :go => true)
    @eventy.user_go?(@user.id).should be_true
  end
  
  it "should user not go to the event" do
    @certificate = Certificate.create(:event => @eventy, :user => @user, :go => false)
    @eventy.user_go?(@user.id).should be_false
  end
  
  it "should have users will go to the event" do
    @certificate = Certificate.create(:event => @eventy, :user => @user, :go => true)
    @eventy.going.present?.should be_true 
  end
  
  it "should have users that was to event" do
    @certificate = Certificate.create(:event => @eventy, :user => @user, :confirmed => true)
    @eventy.confirmed.present?.should be_true
  end
end
