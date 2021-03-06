require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BoscoGurin
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.i18n.available_locales = [:it, :en, :de, :fr]
    config.i18n.default_locale = :en
    config.time_zone = 'Rome'

    config.to_prepare do
      Administrate::ApplicationController.helper BoscoGurin::Application.helpers
    end


    # if defined?(Rails::Server)
    #   config.after_initialize do
    #     config.i18n.available_locales = Preference::VALID_LOCALES & Preference.first.languages.pluck(:locale).map { |l| l.to_sym }
    #   end
    # end
  end
end
