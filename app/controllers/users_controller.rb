class UsersController < ApplicationController
  # represente le profil de l'utilisateur

  before_action :set_user, only: [:show]

  def show
    # preference = []
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
