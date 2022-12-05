class Ark < ApplicationRecord
  belongs_to :category
  belongs_to :artist
  has_many :favorites
  has_many :users, through: :favorites
  has_many :day_ark
  has_many :day_users, foreign_key: "ark_id", class_name: "DayArk"
end
