class ArksController < ApplicationController
  # représente toute les arks

  def index
    @arks = Ark.all
  end

  def show
    @ark = Ark.find(params[:id])
  end
end
