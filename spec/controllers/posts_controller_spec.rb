require 'spec_helper'

describe PostsController do
  def valid_attributes
    {title: 'This is my title', body: 'This is my body'}
  end
  describe "GET 'show'" do
    it "should be successful" do
      get :show, id: 'this-is-my-post'
      response.should be_success
    end
    it "assigns @post" do
      post = Post.create! valid_attributes
      get :show, id: post.slug
      assigns(:post).should eq post
    end
  end
  describe "GET 'new'" do
    it "assigns a new post as @post" do
      get :new
      assigns(:post).should be_a_new(Post)
    end
  end
  describe "POST create" do
    describe "with valid params" do
      it "creates a new post" do
        expect {
          post :create, post: valid_attributes
        }.to change(Post, :count).by(1)
      end
      it "assigns a newly created post as @post" do
        post :create, :post => valid_attributes
        assigns(:post).should be_a(Post)
        assigns(:post).should be_persisted
      end
      it "redirects to the created post" do
        post :create, :post => valid_attributes
        response.should redirect_to(Post.last)
      end
    end
    describe "with invalid params" do
      render_views
      before(:each) do
        Post.any_instance.stub(:save).and_return(false)
      end

      it "assigns a newly created but unsaved post as @post" do
        post :create, post: {}
        assigns(:post).should be_a_new(Post)
      end
    end
  end
end
