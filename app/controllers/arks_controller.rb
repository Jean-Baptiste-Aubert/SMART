class ArksController < ApplicationController
  # représente toute les arks
  before_action :authenticate_user!, only: [:daily_show]

  def related_arks
    @ark = Ark.find(params[:id])

    @artist = @ark.artist
    @artist_arks = @artist.arks

    @date = @ark.date
    @arks = Ark.all
    @date_arks = []
    @arks.each do |ark|
      if ark.date == @date || ark.date.to_i > @date.to_i + 30 || ark.date.to_i > @date.to_i + 30
        @date_arks << ark
      end
      @date_arks
    end


  end

  def daily_show
    # @ark = Ark.new.rand if Ark.date.include?(current_user.preference)
  end

  def show
    @ark = Ark.find(params: [id])
  end

  def unlike
    @ark = Ark.rand if Ark.date.reject?(current_user.preference)
  end
end
