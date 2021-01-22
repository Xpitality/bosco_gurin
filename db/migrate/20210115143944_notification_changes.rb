class NotificationChanges < ActiveRecord::Migration[6.0]
  def change
    remove_column :notifications, :pushed
    add_column :notifications, :visible_in_app, :boolean, default: false
    add_column :notifications, :pushed_to_android_at, :datetime
    add_column :notifications, :pushed_to_ios_at, :datetime
  end
end
