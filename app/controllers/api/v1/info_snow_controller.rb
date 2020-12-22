require 'info_snow_xml_parser'

module Api
  module V1
    class InfoSnowController < Api::V1::ApplicationController
      def feed
        info_snow_feed = InfoSnowXmlParser.new
        render json: info_snow_feed.response
      end
    end
  end
end