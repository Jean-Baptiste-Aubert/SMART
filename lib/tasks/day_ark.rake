namespace :day_ark do

  task select_daily_ark_for_user: :environment do
    DayArk.destroy_all
    User.all.each do |user|
      dates         = []
      user_arks_ids = []
      user.favorites.includes(:ark).each do |favorite|
        dates << favorite.ark.date
        user_arks_ids << favorite.ark.id
      end

      dates = dates.uniq
      ark = dates.any? ? Ark.where(date: dates).sample : Ark.first
      DayArk.create(user_id: user.id, ark_id: ark.id)
    end
  end
end
