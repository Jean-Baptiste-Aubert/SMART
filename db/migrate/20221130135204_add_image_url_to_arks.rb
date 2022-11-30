class AddImageUrlToArks < ActiveRecord::Migration[7.0]
  def change
    add_column :arks, :image_url, :string
  end
end
