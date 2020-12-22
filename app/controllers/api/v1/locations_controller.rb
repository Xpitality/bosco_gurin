module Api
  module V1
    class LocationsController < Api::V1::ApplicationController

      def index
        locations = Location.all
        locations.each { |l| l.weather_refresh }
        render json: locations, include: '**', each_serializer: LocationSerializer
      end
    end
  end
end

