class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pictures
  has_many :favorites, dependent: :destroy
  has_many :fav_pictures, through: :favorites, source: :picture

  def self.guest
    find_or_create_by!(name: 'ゲスト', self_introduction: 'ゲストです！お試し中です', email: 'guest@example.com') do |user|
      user.password = "password"
    end
  end
  
  def self.admin_guest
    find_or_create_by!(name: '管理者ゲスト', self_introduction: '管理者ゲストです。お試し中です', email: 'admin_guest@example.com', admin: true) do |user|
      user.password = SecureRandom.alphanumeric()
    end
  end
end
