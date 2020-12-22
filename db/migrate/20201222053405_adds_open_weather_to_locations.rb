class AddsOpenWeatherToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :open_weather_report, :text
    add_column :locations, :open_weather_time, :datetime
  end
end
