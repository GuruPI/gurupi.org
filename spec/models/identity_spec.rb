require 'spec_helper'

describe Identity do
	it "save identity" do
    Identity.create(user_id: 1, provider: "facebook", uid: "1991291921")
  end

  it "has owner" do
    Identity.new.should be_respond_to :user
  end
end
