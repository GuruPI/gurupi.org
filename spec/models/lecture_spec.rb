require 'spec_helper'

describe Lecture do
  
  it "should calculate votes balance" do
    lecture = Lecture.create(:name => "Rails nao escala", :positive_vote => 10, :negative_vote => 5)
    lecture.relative_votes = 5
  end

end
