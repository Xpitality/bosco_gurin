require 'fcm'

class FcmSender

  attr_reader :response

  def initialize
    @fcm = FCM.new(ENV['FCM_SERVER_KEY'])

  end

  def send(text)
    @response = @fcm.send_with_notification_key("/topics/yourTopic", notification: {body: text})
  end
end