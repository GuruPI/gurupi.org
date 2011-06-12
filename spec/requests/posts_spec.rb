# encoding: UTF-8
require 'spec_helper'

describe "Posts" do
  describe "Post management" do
    it "create a Post and redirects to the Post's page" do
      visit new_post_path
      page.should have_content('Title')
      page.should have_content('Body')
      fill_in "post_title", with: 'This is my title'
      fill_in 'post_body', with: 'This is my body'
      click_button "Criar Post"
      page.should have_content('This is my title')
      page.should have_content('This is my body')
    end
  end

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
