class PagesController < ApplicationController
  # représente l'image du jour
  before_action :authenticate_user!

  def home
  end

  def show
    @ark = Ark.find(params[id])
    if params[:user].present?
      # redirect_to root_path
    else
      @user == current_user
    end
  end
end
