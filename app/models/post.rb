class Post < ApplicationRecord
  belongs_to :user, default: -> { Current.user }
  has_one_attached :image
end
