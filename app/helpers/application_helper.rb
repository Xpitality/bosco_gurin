module ApplicationHelper
  def visible_in_app_notification
    Notification.visible_in_app.first
  end
end
