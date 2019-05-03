class Ward < ApplicationRecord
  has_many :map_layers
  has_many :councillors
  has_many :map_feedbacks, through: :map_layers
  has_one_attached :outline_json

  validates_uniqueness_of :url_slug
  validates_uniqueness_of :show_on_homepage, if: :show_on_homepage

  def as_json
    {
      id: id,
      name: name,
      outline_json_url: outline_url,
      layers: map_layers.map do |layer|
        {
          id: layer.id,
          name: layer.name,
          kml_url: Rails.application.routes.url_helpers.rails_blob_url(layer.kml),
        }
      end,
    }
  end

  def outline_url
    return nil unless outline_json.attached?

    Rails.application.routes.url_helpers.rails_blob_url(outline_json)
  end
end
