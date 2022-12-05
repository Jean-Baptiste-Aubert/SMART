class PagesController < ApplicationController
  # représente l'image du jour
  before_action :authenticate_user!

  def home
    @ark = current_user.daily_arks.first.ark
  end

  def alternative_ark
    #si je clique sur le bouton "je n'aime pas"
    if @ark == "dislike"
    #avec des critèes différents de mes préférences
    @alternative_arks = Ark.all if @ark.date != current_user.favorites.ark.date
    #j'affiche une nouvelle oeuvre similaire image du jour
     @alternative_ark = @alternative_arks.sample.first
    end
  end
end
