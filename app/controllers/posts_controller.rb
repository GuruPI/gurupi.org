class PostsController < ApplicationController
  respond_to :html
  def show
    @post = Post.find_by_slug(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    flash[:notice] = "Post criado com sucesso." if @post.save
    respond_with @post
  end
end
