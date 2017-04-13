class UsersController < ApplicationController
  before_action :set_user,only: [:show,:update,:destroy]
   # GET /users
  def index
    @users = User.all
    render json: @users
  end
 # GET /users/1
  def show
    render json: @user
  end
# POST /users
  def create
    @user = User.create(user_params)
    if @user.save
      render json: @user,status: :created,location: @user
    else
      render json: @user.errors
    end
  end
 # PATCH/PUT /users/1
 def update
    if @user.update(user_params)
     render json: @user
   else
     render json: @user.errors
   end
end
 # DELETE /users/1
 def destroy
   @user.destroy
 end
private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.permit(:uname,:email,:password,:auth_token)
  end
end
