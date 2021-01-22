require 'fcm_sender'

module Admin
  class NotificationsController < Admin::ApplicationController

    def update
      if resource_params["visible_in_app"] == "1"
        Notification.update_all(visible_in_app: false)
      end

      if requested_resource.update(resource_params)
        redirect_to(
            [namespace, requested_resource],
            notice: translate_with_resource("update.success"),
            )
      else
        render :edit, locals: {
            page: Administrate::Page::Form.new(dashboard, requested_resource),
        }
      end
    end

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
