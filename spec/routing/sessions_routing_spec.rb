require "spec_helper"

describe SessionsController do
  describe "routing" do

    it "routes to #create" do
      get("/auth/facebook/callback").should route_to("sessions#create", :provider => 'facebook')
    end

    it "routes to #create" do
      get("/auth/github/callback").should route_to("sessions#create", :provider => 'github')
    end

    it "routes to #destroy" do
      get("/signout").should route_to("sessions#destroy")
    end

  end
end
