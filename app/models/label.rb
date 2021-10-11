class Label < ApplicationRecord
  has_many :labelings, dependent: :destroy
  has_many :pistures, through: :labelings
end
