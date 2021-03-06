class Label < ApplicationRecord
  has_many :labelings, dependent: :destroy
  has_many :pictures, through: :labelings
  validates :name, presence: true
end
