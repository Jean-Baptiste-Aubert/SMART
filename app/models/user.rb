class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites
  has_many :arks, through: :favorites
  has_many :day_arks
  has_many :daily_arks, foreign_key: "user_id", class_name: "DayArk"
end
