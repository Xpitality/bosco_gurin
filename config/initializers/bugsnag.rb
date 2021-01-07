Bugsnag.configure do |config|
  config.api_key = ENV['BUGSNAG_API_KEY']
  config.notify_release_stages = %w(production staging)
  config.timeout = 20
  config.app_version = '1.0.1'
end
