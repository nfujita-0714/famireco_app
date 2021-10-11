class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pictures
  has_many :favorites, dependent: :destroy
  has_many :fav_pictures, through: :favorites, source: :picture

end
