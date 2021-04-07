# copied from some RailsCast (could not remember the #...)
# expects a DEVELOPMENT_REDIRECT_EMAIL env var

class CategoryMailInterceptor
  def self.delivering_email(message)
    message.smtpapi.category = Rails.application.credentials.config[:domain_name]
  end
end

ActionMailer::Base.register_interceptor(CategoryMailInterceptor) if Rails.env.production? || Rails.env.staging?

ActionMailer::Base.smtp_settings = {
  address: Rails.application.credentials.config[:email_provider_address],
  port: 587, # ports 587 and 2525 are also supported with STARTTLS
  enable_starttls_auto: true, # detects and uses STARTTLS
  user_name: Rails.application.credentials.config[:email_provider_username],
  password: Rails.application.credentials.config[:email_provider_password],
  authentication: :plain,
  domain: Rails.application.credentials.config[:domain_name]
}

ActionMailer::Base.default_url_options = { host: Rails.application.credentials.config[:domain_name] }

Premailer::Rails.config.merge!(
  base_url: "https://#{Rails.application.credentials.config[:domain_name]}"
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
