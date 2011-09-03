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
      @post = Post.make!(title: 'This is my title', body: 'This is my body post')
    end

    it "displays 'This is my title'" do
      visit post_path @post
      page.should have_content(@post.title)
    end

    it "displays 'This is my body post'" do
      visit post_path @post
      page.should have_content(@post.body)
    end

    it "should display user's about" do
      visit post_path @post
      page.should have_content("Criado por #{@post.user.name}")
    end
  end

  describe "GET /posts" do
    before(:each) do
      @post = Post.make!(title: 'This is my title', body: 'This is my body post')
    end

    it "page should have a link to post" do
      visit posts_path
      page.should have_link(@post.title)
    end
  end
end
