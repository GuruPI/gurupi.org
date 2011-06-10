# encoding: UTF-8
require 'spec_helper'

describe "Posts" do
  describe "GET /this-is-my-post" do
    before(:each) do
      @post = Post.create(title: 'This is my title', body: 'This is my body post')
    end

    it "displays 'This is my title'" do
      visit post_path @post
      page.should have_content(@post.title)
    end

    it "displays 'This is my body post'" do
      visit post_path @post
      page.should have_content(@post.body)
    end
  end
end
