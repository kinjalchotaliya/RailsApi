class PostsController < ApplicationController
  before_action :set_post, only: [:show,:update,:destroy]
 # GET /posts
  def index
    @posts =Post.all
    render json: @posts
  end
 # GET /posts/1
  def show
    render json: @post
  end
# POST /posts
  def create
    @post = Post.create(post_params)
    if @post.save
      render json: @post,status: :created,location: @post
    else
      render json: @post.errors
    end
  end
 # PATCH/PUT /posts/1
   def update
     if @post.update(post_params)
       render json: @post
     else
       render json: @post.errors
     end
   end
  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end
  def post_params
    params.permit(:title,:body,:user_id)
  end

end
