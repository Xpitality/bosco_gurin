require 'fcm'

class FcmSender

  attr_reader :response

  def initialize
    @fcm = FCM.new(ENV['FCM_SERVER_KEY'])

  end

  def send(text)
    topic = Rails.env.production? ? "Gurin" : "GurinTest"
    @response = @fcm.send_with_notification_key("/topics/#{topic}", notification: {body: text})
  end
end