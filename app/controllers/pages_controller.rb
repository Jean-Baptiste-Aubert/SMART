class PagesController < ApplicationController
  # représente l'image du jour
  before_action :authenticate_user!

  def home
    dates         = []
    user_arks_ids = []
    current_user.favorites.each do |favorite|
      dates << favorite.ark.date
      user_arks_ids << favorite.ark.id
    end

    @dates = dates.uniq
    @ark = Ark.where(date: @dates).sample
  end
end

# user signs up
# > user chooses favorites (arks, hidden favorites)
# > user is redirected to home page
# > user sees a random ark from his favorites
# > user can click on the ark to see more details
# > user can click on the ark to see related arks
# > user can click on the ark to add it to his favorites
# > user can click on the ark to remove it from his favorites
# > user can click on the ark to see the artist
# > user can click on the ark to see the category
# > user can click on the ark to see the date
# > user can click on the ark to see the image
# > user can click on the ark to see the description
# > user can click on the ark to see the name
# > user can click on the ark to see the artist name
# > user can click on the ark to see the category name
# > user can click on the ark to see the artist birth date
# > user can click on the ark to see the artist death date
# > user can click on the ark to see the artist description
# > user can click on the ark to see the artist image
# > user can click on the ark to see the artist
