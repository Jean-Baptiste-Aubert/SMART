class ArksController < ApplicationController
  # représente toute les arks
  before_action :authenticate_user!, only: [:daily_show]

  def related_arks
    @ark = Ark.find(params[:id])

    @artist = @ark.artist
    @artist_arks = @artist.arks

    @date = @ark.date
    @date_arks = Ark.where(date: (@date.to_i - 30)..(@date.to_i + 30))
  end

  def alternative_ark
    @ark = Ark.find(params[:id])
    @date = @ark.date
    @arks = Ark.where.not(date: (@date.to_i - 30)..(@date.to_i + 30))
    @alternative_ark = @arks.sample
  end

  def show
    @ark = Ark.find(params[:id])
  end
end
