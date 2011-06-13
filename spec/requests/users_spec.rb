# encoding: UTF-8
require 'spec_helper'

describe "Users" do
  describe "GET /index" do
    it "displays 'Usuários'" do
      visit users_path
      page.should have_selector('h1', :text => 'Usuários')
    end

    describe "list" do
      before(:each) do
        @users = User.make!(10)
        @users.each { |user| user.roles.create(:title => ['guest', 'member', 'admin'].shuffle[0]) }
        @member = User.make!
        @admin  = User.make!
        @member.roles = [Role.make!(:member)]
        @admin.roles  = [Role.make!(:admin)]
      end

      describe "as guest" do
        it "displays members and admins" do
          visit users_path
          @users.each do |user|
            page.should have_content(user.name) unless user.guest?
          end
        end

        it "don't displays guests" do
          visit users_path
          @users.each do |user|
            page.should_not have_content(user.name) if user.guest?
          end
        end
      end

      describe "as member" do
        it "displays all users" do
          with_user(@member) do
            visit users_path
            @users.each do |user|
              page.should have_content(user.name)
            end
          end
        end

        it "don't displays admin links" do
          with_user(@member) do
            visit users_path
            @users.each do |user|
              page.should_not have_selector('a.user_role')
            end
          end
        end
      end

      describe "as admin" do
        it "displays all users" do
          with_user(@admin) do
            visit users_path
            @users.each do |user|
              page.should have_content(user.name)
            end
          end
        end

        it "displays links to change user role" do
          with_user(@admin) do
            visit users_path
            @users.each do |user|
              page.should have_selector('a.user_role')
            end
          end
        end
      end
    end
  end
end
