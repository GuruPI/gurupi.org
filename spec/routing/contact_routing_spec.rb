# encoding: UTF-8
require "spec_helper"

describe "Routing for Contact page" do
  it "get /contact should route to welcome#contact " do
    {:get => 'contato'}.should route_to(
      :controller => "welcome",
      :action     => "contact"
    )
  end
end