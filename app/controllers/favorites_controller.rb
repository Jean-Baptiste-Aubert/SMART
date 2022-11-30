class FavoritesController < ApplicationController
  # représente le portfolio
  def index
    @favorites = Favorite.all
  end

  def create
    @favorite.user = current_user
    if @favorite.save
      redirect_to favorite_path(@favorite)
    else
      render 'arks/show'
    end
  end

  private

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
