class PagesController < ApplicationController
  # représente l'image du jour
  before_action :authenticate_user!

  def home
    # daily_arks = Ark.date.include?(current_user.preference).all
    @ark = Ark.all.sample
  end
end
