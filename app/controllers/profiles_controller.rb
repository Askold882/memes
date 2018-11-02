class ProfilesController < ApplicationController
  before_action :auth_user

  def index
    @memes = curent_user.memes
    @memes=@memes.order(title: params[:order]) if params[:order].present?
  end

  def show
    @meme = curent_user.memes.find(params[:id])
  end

end