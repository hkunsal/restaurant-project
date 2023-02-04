require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class OrderConfirmation
  def self.send_confirmation(phone_number)
    delivery_time = Time.now + (60 * 60 * 2) # Delivery time is 2 hours from now
    message = "Thank you! Your order was placed and will be delivered before #{delivery_time.strftime("%H:%M")}"

    client = Twilio::REST::Client.new(
      ENV['TWILIO_ACCOUNT_SID'], 
      ENV['TWILIO_AUTH_TOKEN']
    )

    client.messages.create(
      to: phone_number, 
      from: ENV['TWILIO_PHONE_NUMBER'], 
      body: message
    )
  end
end