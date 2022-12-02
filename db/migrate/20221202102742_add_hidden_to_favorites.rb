class AddHiddenToFavorites < ActiveRecord::Migration[7.0]
  def change
    add_column :favorites, :hidden?, :boolean, default: false
  end
end
