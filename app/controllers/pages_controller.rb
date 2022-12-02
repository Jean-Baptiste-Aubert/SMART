class PagesController < ApplicationController
  # représente l'image du jour
  before_action :authenticate_user!

  def home
    @ark = current_user.favorites.first
  end
end
