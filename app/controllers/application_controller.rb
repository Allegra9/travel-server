class ApplicationController < ActionController::API

  #create user:
  def issue_token(payload)
    JWT.encode(payload, secret)
  end

  def secret
    'Polar Bears'
  end

  #authenticate user:

  # def the_current_user
  #   User.find(token_user_id)
  # end

  # def token_user_id
  #   decoded_token.first['id']
  # end
  #
  # def decoded_token
  #   if token
  #     begin
  #       JWT.decode(token, secret, true)
  #     rescue JWT::DecodeError
  #       return [{}]
  #     end
  #   else
  #     [{}]
  #   end
  # end

  # def token
  #   request.headers['Authorization']
  # end

end
