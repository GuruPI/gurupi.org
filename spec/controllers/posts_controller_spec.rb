require 'spec_helper'

describe PostsController do

  describe "GET 'show'" do
    it "should be successful" do
      get 'show', id: 'this-is-my-post'
      response.should be_success
    end
  end

end
