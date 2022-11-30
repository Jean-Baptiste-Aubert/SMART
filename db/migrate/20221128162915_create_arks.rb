class CreateArks < ActiveRecord::Migration[7.0]
  def change
    create_table :arks do |t|
      t.string :name
      t.string :image
      t.string :description
      t.references :category, null: false, foreign_key: true
      t.references :artist, null: false, foreign_key: true
      t.timestamps
    end
  end
end
