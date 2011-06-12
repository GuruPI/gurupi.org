require File.expand_path('spec/spec_helper')

describe User do
  it "should have many posts" do
    User.new.should be_respond_to :posts
  end
end
