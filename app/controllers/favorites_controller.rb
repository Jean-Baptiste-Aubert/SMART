class FavoritesController < ApplicationController
  # représente le portfolio
  def index
    @favorites = Favorite.all
  end

  def create
    @favorite.user = current_user
    @favorite.ark = @ark
    @favorite.save
  end

  def destroy
    @favorite.destroy
  end

  def set_favorite
    @favorite = Favorite.find(params[:id])
  end

  def favorite_params
    params.require(:favorite)
  end
end
