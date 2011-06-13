# encoding: UTF-8
require "spec_helper"

describe UsersController do
  describe "routing" do
    it "routes to #index" do
      get("/users").should route_to("users#index")
    end
  end
end
