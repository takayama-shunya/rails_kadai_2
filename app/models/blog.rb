class Blog < ApplicationRecord
  
  mount_uploader :image, ImageUploader
  
  validates :content, presence: true

  belongs_to :user
  delegate :name, :icon, :id, to: :user, prefix: true

  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
