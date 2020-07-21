class Blog < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  #validates :content, presence: { message: "コメントがありません" }

  belongs_to :user
end
