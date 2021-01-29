require 'fcm_sender'
require 'bugsnag'

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
      fcm.send(Hash[I18n.available_locales.map { |l| [l, notification.send("text_#{l}".to_sym)] }], notification.id)

      status = ''
      failed = []
      fcm.responses.keys.each do |locale|

        if fcm.responses[locale][:status_code] == 200
          notification.pushed_at = Time.now
          notification.save
          status = 'success'
        else
          status = 'fail'
          failed << locale

          Bugsnag.notify(message) do |bugsnag_notification|
            bugsnag_notification.add_tab("notification push fail for #{locale}", fcm.responses[locale])
          end
        end
      end

      redirect_to admin_notifications_path, notice: I18n.t("administrate.controller.notification.push.#{status}", failed_locales: failed.join(', '))
    end

  end
end
