class Favorite < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :ark, dependent: :destroy
  # has_many :arks
end
