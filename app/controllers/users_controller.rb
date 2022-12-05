class UsersController < ApplicationController
  # represente le profil de l'utilisateur

  # before_action :set_user, only: [:show]

  def show
    # preference = []
    # if params[:id]
    #   @users = User.find(params[:id])
    # else
    @user = current_user
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

    create_day_ark_for_new_user

    redirect_to root_path
  end

  private

  def dates_params
    params.require(:user).permit(:dates)
  end

  def create_day_ark_for_new_user
    dates         = []
    user_arks_ids = []
    current_user.favorites.includes(:ark).each do |favorite|
      dates << favorite.ark.date
      user_arks_ids << favorite.ark.id
    end

    dates = dates.uniq
    ark = dates.any? ? Ark.where(date: dates).sample : Ark.first
    DayArk.create(user_id: current_user.id, ark_id: ark.id)
  end

  # def set_user
  #   @user = User.find(params[:id])
  # end
end
