class ProfilesController < ApplicationController
  before_action :authenticate_user, only: [:edit, :update]
  before_action :check_authorization, only: [:edit, :update]
  before_action :set_user
  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else 
      flash.now[:alert] = "Something went wrong. Please try again."
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def check_authorization
    unless current_user.slug == params[:id].to_i
      redirect_to root_url
    end
  end

  def user_params
    params.require(:user).permit(:username, :avatar)
  end

  def avatar
    avatar = avatar.new(user_params)
    if avatar.save
      render json: { message: 'Avatar added!' }, status: 200
    else
      render json: { error: user.errors.full_messages.to_sentence }, status: 500
    end
  end


end