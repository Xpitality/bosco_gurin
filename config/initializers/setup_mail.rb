# copied from some RailsCast (could not remember the #...)
# expects a DEVELOPMENT_REDIRECT_EMAIL env var

class CategoryMailInterceptor
  def self.delivering_email(message)
    message.smtpapi.category = ENV['DOMAIN_NAME']
  end
end

ActionMailer::Base.register_interceptor(CategoryMailInterceptor) if Rails.env.production? || Rails.env.staging?

ActionMailer::Base.smtp_settings = {
  address: ENV['EMAIL_PROVIDER_ADDRESS'],
  port: 587, # ports 587 and 2525 are also supported with STARTTLS
  enable_starttls_auto: true, # detects and uses STARTTLS
  user_name: ENV['EMAIL_PROVIDER_USERNAME'],
  password: ENV['EMAIL_PROVIDER_PASSWORD'],
  authentication: :plain,
  domain: ENV['DOMAIN_NAME']
}

ActionMailer::Base.default_url_options = { host: ENV['DOMAIN_NAME'] }

Premailer::Rails.config.merge!(
  base_url: "http://#{ENV['DOMAIN_NAME']}"
)

# unless Rails.env.development?
#   ActionMailer::Base.smtp_settings = {
#     address: 'email-smtp.eu-west-1.amazonaws.com',
#     port: 587, # ports 587 and 2525 are also supported with STARTTLS
#     enable_starttls_auto: true, # detects and uses STARTTLS
#     user_name: Rails.application.secrets.email_provider_username,
#     password: Rails.application.secrets.email_provider_password,
#     authentication: 'login'
#   }
#
#   if ENV['redirection_email']
#     ActionMailer::Base.register_interceptor(ActionmailerInterceptor::MailInterceptor)
#   end
#
#   Premailer::Rails.config.merge!(
#     base_url: "http://#{ActionMailer::Base.default_url_options[:host]}"
#   )
# end
