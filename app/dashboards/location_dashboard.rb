require "administrate/base_dashboard"

class LocationDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    lng: Field::String,
    lat: Field::String,
    elevation: Field::Number,
    webcam: Field::String,
    open_weather_report: Field::Text,
    mdx_meteotest_meteo_days: Field::Text,
    mdx_meteotest_meteo_standard: Field::Text,
    open_weather_time: Field::DateTime,
    weather_forecast: Field::Boolean,
    missing_mdx_meteo: Field::Boolean,
    mdx_meteotest_key: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  id
  name
  weather_forecast
  mdx_meteotest_key
  missing_mdx_meteo
  lng
  lat
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  id
  name
  lng
  lat
  elevation
  webcam
  weather_forecast
  open_weather_report
  open_weather_time
  mdx_meteotest_key
  mdx_meteotest_meteo_days
  mdx_meteotest_meteo_standard
  created_at
  updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  name
  weather_forecast
  mdx_meteotest_key
  lng
  lat
  elevation
  webcam
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how locations are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(location)
  #   "Location ##{location.id}"
  # end

  def self.api_url(resource)
    ['/api/v1/locations']
  end
end
