class AddDateToArk < ActiveRecord::Migration[7.0]
  def change
    add_column :arks, :date, :integer
  end
end
