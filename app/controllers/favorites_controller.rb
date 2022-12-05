class FavoritesController < ApplicationController
  # représente le portfolio
  before_action :set_favorite, only: [:destroy]
  def index
    @favorites = Favorite.all
  end

  def create
    @ark = Ark.find(params[:ark_id])
    @favorite = Favorite.new
    @favorite.user = current_user
    @favorite.ark = @ark
    if @favorite.save
      redirect_to ark_favorites_path, notice: "Ark added to your favorites"
    else
      render :root
    end
  end

  def destroy
    @favorite.destroy
    redirect_to :favorites
  end

  def set_favorite
    @favorite = Favorite.find(params[:id])
  end

  def favorite_params
    params.require(:favorite)
  end
end
