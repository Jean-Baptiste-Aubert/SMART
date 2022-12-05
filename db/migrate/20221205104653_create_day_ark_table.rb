class CreateDayArkTable < ActiveRecord::Migration[7.0]
  def change
    create_table :day_arks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :ark, null: false, foreign_key: true

      t.timestamps
    end
  end
end
