class Picture < ApplicationRecord
  belongs_to :user
  has_many :labelings, dependent: :destroy
  has_many :labels, through: :labelings

  mount_uploader :image, ImageUploader
end
