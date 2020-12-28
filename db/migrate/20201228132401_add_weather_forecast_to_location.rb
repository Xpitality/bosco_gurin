class AddWeatherForecastToLocation < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :weather_forecast, :boolean
  end
end
