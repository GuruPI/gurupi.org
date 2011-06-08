# encoding: UTF-8
require 'spec_helper'

describe "Sessions" do
  button_login = 'Conectar com Facebook'

  describe "GET /" do
    it "displays '#{button_login}'" do
      visit root_path
      page.should have_content(button_login)
    end

    it "displays User name and image" do
      visit root_path
      click_on button_login
      # save_and_open_page
      page.should have_content("Gurupi Piauí")
      page.should have_selector("img[src='http://graph.facebook.com/100000161878338/picture?type=square']")
      page.should have_content("Sair")
    end
  end

  describe "GET /signout" do
    it "exit and displays '#{button_login}' again" do
      visit root_path
      click_on button_login
      click_on 'Sair'
      page.should have_content(button_login)
    end
  end
end
