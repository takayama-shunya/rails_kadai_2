class Picture < ApplicationRecord
  mount_uploader :img, ImageUploader
end
