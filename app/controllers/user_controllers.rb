class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      UserMailer.send_confirmation_email(user).deliver_now
      render json: { message: 'User created, now confirm your email!' }
    else
      render json: { error: user.errors.full_messages.to_sentence }
    end
  end

  def update
    user = User.find_by(confirm_token: params[:confirm_token])
    if user
      user.update(confirm_token: nil)
      redirect_to new_session_path
    else
      render json: { error: 'Wrong token!' }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end