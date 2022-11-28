class Ark < ApplicationRecord
  belongs_to :category
  belongs_to :artist
  belongs_to :material
  belongs_to :style
  has_many :favorites
  has_many :users, through: :favorites
end
