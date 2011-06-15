# encoding: UTF-8
require 'spec_helper'

describe ApplicationHelper do
  describe "user_role" do
    it "should displays user role formatted (as admin)" do
      member = User.make!
      member.roles << Role.make!(:admin)
      user_role(member).should == %{<span class="user_role admin">Admin</span>}
    end

    it "should displays user role formatted (as member)" do
      member = User.make!
      member.roles << Role.make!(:member)
      user_role(member).should == %{<span class="user_role member">Membro</span>}
    end

    it "should displays user role formatted (as guest)" do
      member = User.make!
      user_role(member).should == %{<span class="user_role guest">Visitante</span>}
    end
  end
end