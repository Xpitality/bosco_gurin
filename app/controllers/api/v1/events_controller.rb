module Api
  module V1
    class EventsController < Api::V1::ApplicationController

      def index
        events = Event.all
        render json: events, each_serializer: EventSerializer
      end

    end
  end
end

