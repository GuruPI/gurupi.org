require 'spec_helper'

describe Certificate do
  it "generations attested" do
    @user = User.make!(:identities => [Identity.make!])
    @attested = Certificate.create(:user => @user, :event => Event.make!)
    array_texts = PDF::Inspector::Text.analyze(@attested.generate.render).strings
    array_texts.include?(@attested.user.identities.first.name).should be_true
  end
end
