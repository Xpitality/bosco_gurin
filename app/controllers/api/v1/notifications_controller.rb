module Api
  module V1
    class NotificationsController < Api::V1::ApplicationController

      def index
        notifications = Notification.visible_in_app
        render json: notifications, each_serializer: NotificationSerializer
      end

      def show
        notification = Notification.where(id: params[:id])
        render json: notification
      end

    end
  end
end

