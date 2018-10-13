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

  # def create
  #   user = User.create(users_params) #or users_params
  #   #render json: user
  #   if user && user.authenticate(params[:password])
  #     render json: { token: issue_token({ id: user.id }) }
  #   else
  #     render json: {error: "Cannot find or authenticate user"}
  #   end
  # end
  # begin
  #   # your code that attempts to login the user
  # rescue BCrypt::Errors::InvalidHash
  #   flash[:error] = 'We recently adjusted the way our passwords are stored. Please click the "forgot username or password?" link to re-establish your password. Thank you for your understanding!'
  #   redirect_to password_resets_url
  # end

  # def get_current_user
  #   if the_current_user
  #     render json: the_current_user
  #   else
  #     render json: { error: 'no user'}
  #   end
  # end

  #private

  # def users_params
  #   params.require(:user).permit(:username, :email, :password)
  # end

end
