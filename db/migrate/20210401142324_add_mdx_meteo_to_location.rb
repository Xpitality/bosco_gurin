class AddMdxMeteoToLocation < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :mdx_meteotest_meteo_standard, :text
    add_column :locations, :mdx_meteotest_meteo_days, :text
    add_column :locations, :mdx_meteotest_key, :string
  end
end
