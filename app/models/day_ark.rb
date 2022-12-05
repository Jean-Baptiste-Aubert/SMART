class DayArk < ApplicationRecord
  belongs_to :user
  belongs_to :ark
  # has_many :arks
end
