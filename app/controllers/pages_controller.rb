class PagesController < ApplicationController
  # représente l'image du jour
  before_action :authenticate_user!

  def home
    dates         = []
    user_arks_ids = []
    current_user.favorites.each do |favorite|
      dates << favorite.ark.date
      user_arks_ids << favorite.ark.id
    end

    @dates = dates.uniq
    @ark = @dates.any? ? Ark.where(date: @dates).sample : Ark.first
  end
end
