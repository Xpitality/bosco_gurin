module Api
  module V1
    class PreferencesController < Api::V1::ApplicationController
      def show
        preferences = Preference.all

        render json: preferences
      end
    end
  end
end