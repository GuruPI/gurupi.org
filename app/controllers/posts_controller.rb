# encoding: UTF-8
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
    @post = Post.new(post_params)
    @post.user = current_user
    flash[:notice] = "Post criado com sucesso." if @post.save
    respond_with @post
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
