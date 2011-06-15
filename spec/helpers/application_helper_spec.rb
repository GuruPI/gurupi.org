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

  describe "markdown" do
    describe "should displays text formatted" do
      before(:each) do
        text = <<END
paragraph 1 *italic text*

paragraph 2 **bold text**
END
        @formatted = markdown(text)
      end

      it "with paragraphs" do
        @formatted.should have_selector("p", :text => "paragraph 1 italic text")
        @formatted.should have_selector("p", :text => "paragraph 2 bold text")
      end

      it "with bold" do
        @formatted.should have_selector("strong", :text => "bold text")
      end

      it "with italic" do
        @formatted.should have_selector("em", :text => "italic text")
      end
    end
  end
end