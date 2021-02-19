module Api
  module V1
    class NotificationsController < Api::V1::ApplicationController

      def index
        if params['last_pushed']
          notifications = Notification.order('pushed_at DESC').limit(1)
        else
          notifications = Notification.visible_in_app
        end
        render json: notifications, each_serializer: NotificationSerializer
      end

      def show
        notification = Notification.where(id: params[:id])
        render json: notification
      end

    end
  end
end

