class Ark < ApplicationRecord
  belongs_to :category
  belongs_to :artist
  has_many :favorites
  has_many :users, through: :favorites
end
