class RemoveImageFromArk < ActiveRecord::Migration[7.0]
  def change
    remove_column :arks, :image
  end
end
