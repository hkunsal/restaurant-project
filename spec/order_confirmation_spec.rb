require 'order_confirmation'
require 'twilio-ruby'
require 'dotenv'

RSpec.describe OrderConfirmation do
  it "sends a confirmation text to the customer" do
    phone_number = "+905332254977"
    delivery_time = Time.now + (60 * 60 * 2)
    message = "Thank you! Your order was placed and will be delivered before #{delivery_time.strftime("%H:%M")}"

    client = Twilio::REST::Client.new(
      ENV['TWILIO_ACCOUNT_SID'], 
      ENV['TWILIO_AUTH_TOKEN']
    )

    response = client.messages.create(
      to: phone_number, 
      from: ENV['TWILIO_PHONE_NUMBER'], 
      body: message
    )

    expect(response.sid).to_not be_empty
  end
end

