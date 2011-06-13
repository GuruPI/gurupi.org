require 'spec_helper'

describe User do
  before(:each) do
    @user = User.make!
  end

  it "should have many posts" do
    User.new.should be_respond_to :posts
  end

  it "should not have roles (default)" do
    @user.roles.should be_empty
  end

  it "should return roles array" do
    role = Role.make!
    @user.roles << role
    @user.roles.should eql [role]
  end

  it "should return roles in symbol format" do
    @user.roles.create(:title => "test")
    @user.role_symbols.should eql [:test]
  end

  it "should return main role" do
    @user.roles.create(:title => "test")
    @user.role.should eql "guest"
    @user.roles << Role.make!(:member)
    @user.role.should eql "member"
  end

  describe "admin?" do
    it "should not be" do
      @user.roles.create(:title => "test")
      @user.admin?.should be_false
    end

    it "should be" do
      @user.roles.create(:title => "admin")
      @user.admin?.should be_true
    end
  end

  describe "member?" do
    it "should not be" do
      @user.roles.create(:title => "admin")
      @user.member?.should be_false
      @user.roles.create(:title => "member")
      @user.member?.should be_false
    end

    it "should be" do
      @user.roles.create(:title => "member")
      @user.member?.should be_true
    end
  end

  describe "guest?" do
    it "should not be (it's admin)" do
      @user.roles.create(:title => "admin")
      @user.guest?.should be_false
    end

    it "should not be (it's member)" do
      @user.roles.create(:title => "member")
      @user.guest?.should be_false
    end

    it "should be" do
      @user.roles.create(:title => "test")
      @user.guest?.should be_true
    end
  end

  it "should change user role" do
    @user.change_role("admin")
    @user.admin?.should be_true
    @user.change_role("member")
    @user.member?.should be_true
    @user.change_role("guest")
    @user.guest?.should be_true
  end
end
