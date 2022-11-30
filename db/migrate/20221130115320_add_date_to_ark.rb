class AddDateToArk < ActiveRecord::Migration[7.0]
  def change
    add_column :arks, :date, :string
  end
end
