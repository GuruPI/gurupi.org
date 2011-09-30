require 'spec_helper'

describe Lecture do
  
  it "should calculate votes balance" do
    lecture = Lecture.create(:name => "Rails nao escala", :positive_vote => 10, :negative_vote => 5)
    lecture.relative_votes = 5
  end

  it "should order lectures from balance" do
    pending "Como fazer um teste que garanta a ordem dentro de um array?"
    lecture1 = Lecture.create(:positive_vote => 10, :negative_vote => 1)
    lecture2 = Lecture.create(:positive_vote => 11, :negative_vote => 2)
    lecture3 = Lecture.create(:positive_vote => 9,  :negative_vote => 0)
    Lecture.ranking.should == [lecture3, lecture1, lecture2]
  end

end
