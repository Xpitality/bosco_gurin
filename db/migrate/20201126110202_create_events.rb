class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.date :date_from
      t.date :date_to
      t.attachment :image
      t.text :text
      t.date :expiry_date

      t.timestamps
    end
  end
end
