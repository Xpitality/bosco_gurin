class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :lng
      t.string :lat
      t.integer :elevation
      t.string :webcam

      t.timestamps
    end
  end
end
