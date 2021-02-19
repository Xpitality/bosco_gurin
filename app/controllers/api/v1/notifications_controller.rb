module Api
  module V1
    class NotificationsController < Api::V1::ApplicationController

      def index
        if params['last_pushed']
          notification = Notification.order('pushed_at DESC').first
          notification = [] unless notification
          render json: notification, serializer: NotificationSerializer
        else
          notifications = Notification.visible_in_app
          render json: notifications, each_serializer: NotificationSerializer
        end
      end

      def show
        notification = Notification.where(id: params[:id])
        render json: notification
      end

    end
  end
end

