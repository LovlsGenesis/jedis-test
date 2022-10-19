class TwilioTextMessenger
  attr_reader :message

  def initialize(message, number)
    @message = message
    @number = number
  end

  def call
    client = Twilio::REST::Client.new
    client.messages.create(
      {
        from: ENV['TWILIO_PHONE_NUMBER'],
        to: "+55#{@number}",
        body: @message
      }
    )
  end
end
