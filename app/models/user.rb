class User < ApplicationRecord

  mount_uploader :icon, ImageUploader
  
  before_validation { email.downcase! }

  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 50 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  has_many :blogs, dependent: :destroy

  has_many :favorites, dependent: :destroy

end
