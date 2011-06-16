# encoding: UTF-8
require "spec_helper"

describe "Routing for About page" do
  it "get /about should route to welcome#about " do
    {:get => 'about'}.should route_to(
      :controller => "welcome",
      :action     => "about"
    )
  end
end