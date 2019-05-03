require "administrate/base_dashboard"

class MapFeedbackDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    map_layer: Field::BelongsTo,
    id: Field::Number,
    email: Field::String,
    text: Field::Text,
    route_name: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :map_layer,
    :id,
    :email,
    :text,
    :route_name,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :map_layer,
    :id,
    :email,
    :text,
    :route_name,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :map_layer,
    :email,
    :text,
    :route_name,
  ].freeze

  # Overwrite this method to customize how map feedbacks are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(map_feedback)
  #   "MapFeedback ##{map_feedback.id}"
  # end
end
