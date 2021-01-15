class CreateLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :languages do |t|
      t.string :locale
      t.string :name
      t.belongs_to :preference
    end
  end
end
