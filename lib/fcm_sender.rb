require 'fcm'

class FcmSender

  attr_reader :responses

  def initialize
    @fcm = FCM.new(ENV['FCM_SERVER_KEY'])

  end

  def send(text_hash, title_hash, id)
    topic = Rails.env.production? ? "Gurin" : "GurinTest"

    # @response = @fcm.send_with_notification_key("/topics/#{topic}", notification: {body: id})
    @responses = {}

    text_hash.keys.each do |locale|
      if text_hash[locale]
        @responses[locale] = @fcm.send_with_notification_key("/topics/#{topic}#{locale.capitalize}", notification: {body: text_hash[locale], title: title_hash[locale]})
      end
    end
  end
end