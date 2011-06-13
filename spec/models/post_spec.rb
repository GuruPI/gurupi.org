require 'spec_helper'

describe Post do
  it "should save slug" do
    post = Post.create(title: 'This is my post')
    post.slug.should be_present
    post.slug.should eql 'this-is-my-post'
  end

  it "to param should return slug" do
    Post.create(title: 'This is my post').to_param.should eql 'this-is-my-post'
  end

  it "should has owner" do
    Post.new.should be_respond_to :user
  end
end
