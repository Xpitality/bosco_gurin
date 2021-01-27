require 'fcm'

class FcmSender

  attr_reader :response

  def initialize
    @fcm = FCM.new(ENV['FCM_SERVER_KEY'])

  end

  def send(text_hash, id)
    topic = Rails.env.production? ? "Gurin" : "GurinTest"

    # @response = @fcm.send_with_notification_key("/topics/#{topic}", notification: {body: id})

    text_hash.keys.each do |locale|
      @response = @fcm.send_with_notification_key("/topics/#{topic}#{locale.capitalize}", notification: {body: text_hash[locale]})
    end
  end
end