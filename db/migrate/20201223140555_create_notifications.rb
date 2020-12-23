class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.text :text
      t.boolean :pushed, default: false

      t.timestamps
    end
  end
end
