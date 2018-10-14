class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def create
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    if user.valid?
      render json: { token: issue_token({ id: user.id }) }
    else
      user = User.find_by(username: params[:username])
      if user
        render json: {error: "*Username already exists"}
      else
        render json: {error: "*Email already exists"}
      end
    end
  end

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: { token: issue_token({ id: user.id }) }
    else
      render json: {error: "Cannot find or authenticate user"}
    end
  end

  def get_current_user
    if the_current_user
      render json: the_current_user
    else
      render json: { error: 'no user'}
    end
  end

end
