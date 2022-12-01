class Artist < ApplicationRecord
  has_many :arks, dependent: :destroy
end
