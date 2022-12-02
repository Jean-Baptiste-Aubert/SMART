class UsersController < ApplicationController
  # represente le profil de l'utilisateur

  before_action :set_user, only: [:show]

  def show
    # preference = []
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end

  def choosen
    years = [1450, 1550, 1650, 1750, 1850, 1950].select do |year|
      year if params[:dates].values.map(&:to_i).include?(year)
    end

    years.each do |year|
      @arks = Ark.where(date: (year.to_i - 50)..(year.to_i + 50))
      @arks.each do |ark|
        Favorite.create!(ark: ark, user: current_user, hidden?: true)
      end
    end

    redirect_to root_path
  end

  private

  def dates_params
    params.require(:user).permit(:dates)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
