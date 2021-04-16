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

              i = 0
              location.mdx_meteotest_meteo_days = location.mdx_meteotest_meteo_days.map do |d|
                d[:day_name] = (Date.today + i).strftime("%A")
                i += 1
                d
              end
              location.mdx_meteotest_meteo_standard = location.mdx_meteotest_meteo_standard.map{|m| m["n"] ||= (0..8).to_a.sample }
              location.save
              location.reload
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

      def mdx_weather_descriptions
        render json: MdxMeteotest::WEATHER_DESCRIPTIONS.to_json
      end

      def mdx_weather_description
        render json: MdxMeteotest::WEATHER_DESCRIPTIONS[params['id'].to_i].to_json
      end
    end
  end
end

