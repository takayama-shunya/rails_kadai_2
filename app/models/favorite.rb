class Favorite < ApplicationRecord

  belongs_to :user
  delegate :name, :icon, :id, to: :user, prefix: true

  belongs_to :blog

end
