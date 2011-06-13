# encoding: UTF-8
require "spec_helper"

describe UsersController do
  describe "routing" do
    it "routes to #index" do
      get("/users").should route_to("users#index")
    end

    it "routes to #change" do
      put("/users/42/change/whatever").should route_to("users#change", :id => '42', :role => 'whatever')
    end
  end
end
