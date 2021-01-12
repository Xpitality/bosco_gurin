require 'info_snow_xml_parser'

module Api
  module V1
    class InfoSnowController < Api::V1::ApplicationController
      def feed
        info_snow_feed = InfoSnowXmlParser.new
        if params['only-snow-height']
          resort = info_snow_feed.response[:resort]
          render json: { resort: {
              WTDailyNewFallenSnowHeightArenaLow: resort['WTDailyNewFallenSnowHeightArenaLow'],
              WTDailyNewFallenSnowHeightArenaHigh: resort['WTDailyNewFallenSnowHeightArenaHigh'],
              WTDailyDateLastSnowfallResort: resort['WTDailyDateLastSnowfallResort'],
              WTDailyDateLastSnowfallArena: resort['WTDailyDateLastSnowfallArena'],
              WTDailyDepthSnowOrtResort: resort['WTDailyDepthSnowOrtResort'],
              WTDailyDepthSnowOrtArenaLow: resort['WTDailyDepthSnowOrtArenaLow'],
              WTDailyDepthSnowOrtArenaHigh: resort['WTDailyDepthSnowOrtArenaHigh']
          }
          }
        else
          render json: info_snow_feed.response
        end
      end
    end
  end
end