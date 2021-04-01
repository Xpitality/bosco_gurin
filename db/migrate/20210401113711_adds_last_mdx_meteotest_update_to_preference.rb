class AddsLastMdxMeteotestUpdateToPreference < ActiveRecord::Migration[6.0]
  def change
    add_column :preferences, :last_mdx_meteotest_update, :datetime
  end
end
