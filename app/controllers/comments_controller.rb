class CommentsController < ApplicationController
  def index
    @comments = Comment.where(post_id: params[:post_id])
    @data = []
    @comments.each do |comment|
      @data << comment_data(comment)
    end

    respond_to do |format|
      format.json { render json: @data.to_json }
    end
  end

  def create
    @comment = Comment.new({
      name: current_user_provider.name, 
      body: comment_params[:body], 
      identity_id: current_user_provider.id, 
      post_id: params[:post_id]
    })

    if @comment.save
      @data = comment_data(@comment)
      respond_to do |format|
        format.json { render json: @data.to_json }
      end
    end
  end

  private
    def comment_data(comment)
      {
        user: {
          uid: comment.identity_id, 
          name: comment.name, 
          image: comment.identity.image
        }, 
        body: comment.body
      }
    end

    def comment_params
      params.permit(:body)
    end
end
