require 'fcm_sender'

module Admin
  class NotificationsController < Admin::ApplicationController

    def push
      notification = Notification.find params[:notification_id]

      fcm = FcmSender.new
      fcm.send notification.text

      if fcm.response[:status_code] == 200
        notification.pushed_at = Time.now
        notification.save
        status = 'success'
      else
        status = 'fail'
      end

      redirect_to admin_notifications_path, notice: translate_with_resource("notification.push.#{status}")
    end

  end
end
