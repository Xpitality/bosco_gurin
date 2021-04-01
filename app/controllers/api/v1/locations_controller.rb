require 'mdx_meteotest'

module Api
  module V1
    class LocationsController < Api::V1::ApplicationController

      def index
        if Preference.mdx_meteotest_refresh_needed?
          mdx_meteotest = MdxMeteotest.new
          mdx_meteotest.call
          if mdx_meteotest.success?
            Location.all.each do |location|
              location.mdx_meteotest_meteo_standard = mdx_meteotest.meteo_standard[location.mdx_meteotest_key]
              location.mdx_meteotest_meteo_days = mdx_meteotest.meteo_days[location.mdx_meteotest_key]
              location.save
            end
            Preference.last_mdx_meteotest_update!
          end
        end

        locations = Location.all
        locations.each { |l| l.weather_refresh }
        render json: locations, include: '**', each_serializer: LocationSerializer
      rescue Net::OpenTimeout => e
        render json: locations, include: '**', each_serializer: LocationSerializer
      end

    end
  end
end

