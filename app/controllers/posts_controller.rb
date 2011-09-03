class PostsController < ApplicationController
  respond_to :html

  def index
    @posts = Post.all
    respond_with(@posts)
  end

  def show
    @post = Post.find_by_slug(params[:id])
    @breadcrumb = "Blogs"
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post].merge(user: current_user))
    flash[:notice] = "Post criado com sucesso." if @post.save
    respond_with @post
  end
end
