class CommentsController < ApplicationController
  before_action :set_comment,only: [:show,:update,:destroy]
   # GET /comments
  def index
    @comments = Comment.all
    render json: @comments
  end
 # GET /comments/1
  def show
    render json: @comment
  end
# POST /comments
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      render json: @comment,status: :created,location: @comment
    else
      render json: @comment.errors
    end
  end
 # PATCH/PUT /comments/1
 def update
    if @comment.update(comment_params)
     render json: @comment
   else
     render json: @comment.errors
   end
end
 # DELETE /comments/1
 def destroy
   @comment.destroy
 end
private
  def set_comment
    @comment = Comment.find(params[:id])
  end
  def comment_params
    params.permit(:body,:user_id,:post_id)
  end
end
