class UsersController < ApplicationController
  # represente le profil de l'utilisateur

  before_action :set_user, only: [:show]
  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
