# encoding: UTF-8
require 'spec_helper'

describe "Sessions" do
  button_login_facebook = 'Conectar com Facebook'
  button_login_github = 'Conectar com Github'
  button_login_twitter = 'Conectar com Twitter'

  describe "GET /" do
    it "displays '#{button_login_facebook}'" do
      visit root_path
      page.should have_content(button_login_facebook)
    end

    it "displays '#{button_login_github}'" do
      visit root_path
      page.should have_content(button_login_github)
    end
   
    it "displays '#{button_login_twitter}'" do
      visit root_path
      page.should have_content(button_login_twitter)
    end

    it "displays User name and image when sign in via Facebook" do
      visit root_path
      click_on button_login_facebook
      # save_and_open_page
      page.should have_content("Gurupi Piauí")
      page.should have_selector("img[src='http://graph.facebook.com/100000161878338/picture?type=square']")
      page.should have_content("Sair")
    end

    it "displays User name and image when sign in via Github" do
      visit root_path
      click_on button_login_github
      # save_and_open_page
      page.should have_content("Gurupi Piauí")
      page.should have_selector("img[src='http://postview.rubyforge.org/images/logos/github_octocat.png']")
      page.should have_content("Sair")
    end
  end

  describe "GET /signout" do
    it "exit and displays '#{button_login_facebook}' again" do
      visit root_path
      click_on button_login_facebook
      click_on 'Sair'
      page.should have_content(button_login_facebook)
    end

    it "exit and displays '#{button_login_github}' again" do
      visit root_path
      click_on button_login_github
      click_on 'Sair'
      page.should have_content(button_login_github)
    end
   
    it "exit and displays '#{button_login_twitter}' again" do
      visit root_path
      click_on button_login_twitter
      click_on "Sair"
      page.should have_content(button_login_twitter)
    end
   
  end

  describe "POST /login/auth" do
    it "authenticate and displays user when sign in Twitter" do
      visit root_path
      page.should have_content(button_login_twitter)
      set_omniauth_twitter()
      user_name  = OmniAuth.config.mock_auth[:twitter][:info][:name]
      click_link button_login_twitter
      page.should have_content 'Sair'
      page.should have_content user_name
    end
  end
end
