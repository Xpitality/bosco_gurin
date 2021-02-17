class AddTitleToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :title, :text
  end
end
