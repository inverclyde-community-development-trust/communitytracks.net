class Event < ApplicationRecord
  belongs_to :user, default: -> { Current.user }, optional: true
  has_one_attached :image
end
