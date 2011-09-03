require 'spec_helper'

describe VoteLecture do
  it "should save vote_lecture" do
    vote_lecture = VoteLecture.create(user_id: 1, lecture_id: 1)
  end
end

