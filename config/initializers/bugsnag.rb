Bugsnag.configure do |config|
  config.api_key = Rails.application.credentials.config[:bugsnag_api_key]
  config.notify_release_stages = %w(production staging)
  config.timeout = 20
  config.app_version = '1.0.1'
end
