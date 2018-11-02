class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      if user.confirm_token == nil
        cookies[:user_token] = user.user_token
        redirect_to profile_path
      else
        render json: { error: 'unconfirmed' }
      end
    else
      render json: { error: 'wrong data' }
    end
  end

  def destroy
    curent_user.regenerate_user_token
    redirect_to new_session_path
  end
end
