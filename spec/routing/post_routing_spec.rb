require File.expand_path('spec/spec_helper')

describe PostsController do
  describe "routing recognizes and generates" do
    it "#show" do
      { get: '/posts/this-is-my-post'}.should route_to(controller: 'posts', action: 'show', id: 'this-is-my-post')
    end
    it "#new" do
      { get: '/posts/novo'}.should route_to(controller: 'posts', action: 'new')
    end
    it "#create" do
      { post: '/posts'}.should route_to(controller: 'posts', action: 'create')
    end
  end
end
