class AddShowWeatherToLocation < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :show_weather, :boolean
  end
end
