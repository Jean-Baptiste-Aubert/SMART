class Ark < ApplicationRecord
  belongs_to :category
  belongs_to :artist
  has_many :favorites
  has_many :users, through: :favorites
  has_many :day_ark
  has_many :day_users, foreign_key: "ark_id", class_name: "DayArk"

  def description_paragraphs
    description.sub(/.+?(?=[A-Z])/m, "").split(/([.!?])(?<!cf.|[A-Z]\.)\s*(?=[A-Z])/).each_slice(6).to_a
  end
end
