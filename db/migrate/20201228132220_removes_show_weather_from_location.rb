class RemovesShowWeatherFromLocation < ActiveRecord::Migration[6.0]
  def change
    remove_column :locations, :show_weather
  end
end
