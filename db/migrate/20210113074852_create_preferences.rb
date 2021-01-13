class CreatePreferences < ActiveRecord::Migration[6.0]
  def change
    create_table :preferences do |t|
      t.integer :request_timeout, default: 15
      t.timestamps
    end
  end
end
