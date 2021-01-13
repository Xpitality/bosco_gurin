module Admin
  class PreferencesController < Admin::ApplicationController
    def index
      preference = Preference.first
      unless preference
        preference = Preference.create
      end
      redirect_to admin_preference_path(preference)
    end

    def new
      redirect_to admin_preferences_path
    end

    def create
      redirect_to admin_preferences_path
    end
  end
end
