# encoding: UTF-8
class PostsController < ApplicationController
  def show
    @post = Post.find_by_slug(params[:id])
  end
end

