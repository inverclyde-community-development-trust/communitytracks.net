require "administrate/base_dashboard"

class WardDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    outline_json: Field::ActiveStorage,
    map_feedbacks: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    url_slug: Field::String,
    map_layers: Field::HasMany,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    show_on_homepage: Field::Boolean,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :name,
    :show_on_homepage,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :name,
    :url_slug,
    :show_on_homepage,
    :map_layers,
    :outline_json,
    :created_at,
    :updated_at,
    :map_feedbacks,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :url_slug,
    :outline_json,
    :show_on_homepage,
  ].freeze

  # Overwrite this method to customize how wards are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(ward)
    ward.name
  end
end
