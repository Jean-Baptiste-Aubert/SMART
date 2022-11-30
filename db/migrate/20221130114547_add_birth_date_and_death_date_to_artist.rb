class AddBirthDateAndDeathDateToArtist < ActiveRecord::Migration[7.0]
  def change
    add_column :artists, :birth_date, :string
    add_column :artists, :death_date, :string

  end
end
