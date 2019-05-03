class MapLayer < ApplicationRecord
  belongs_to :ward
  has_many :map_feedbacks
  has_one_attached :kml
end
