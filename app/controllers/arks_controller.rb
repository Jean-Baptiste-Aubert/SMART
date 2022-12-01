class ArksController < ApplicationController
  # représente toute les arks

  def artist_index
    @arks = Ark.artist_id.all
  end

  def date_index
    @arks = ArK.date.all
  end

  def show
    @ark = Ark.find(params: [id])
  end

  def unlike
    @ark = Ark.rand if Ark.date.reject?(current_user.preference)
  end
end
