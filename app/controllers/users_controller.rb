class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      render json: { message: 'User created!' }, status: 200
    else
      render json: { error: user.errors.full_messages.to_sentence }, status: 500
      
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end