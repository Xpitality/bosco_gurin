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

    def update
      if requested_resource.update(resource_params)
        # config.i18n.available_locales = Preference::VALID_LOCALES & Preference.first.languages.pluck(:locale).map { |l| l.to_sym }
        redirect_to(
            [namespace, requested_resource],
            notice: translate_with_resource("update.success"),
            )
      else
        render :edit, locals: {
            page: Administrate::Page::Form.new(dashboard, requested_resource),
        }
      end
    end
  end
end
