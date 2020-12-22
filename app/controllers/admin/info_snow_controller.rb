require 'info_snow_xml_parser'

module Admin
  class InfoSnowController < Administrate::ApplicationController
    def show
      info_snow_feed = InfoSnowXmlParser.new
      @response = JSON.pretty_generate info_snow_feed.response
    end
  end
end