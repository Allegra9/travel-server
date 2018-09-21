class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def create
    user = User.create(username: params[:username]) #or users_params
    render json: user
  end

  private

  def users_params
    params.require(:user).permit(:username) #then password 
  end

end
