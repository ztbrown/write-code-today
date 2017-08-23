require_relative '../lib/twilio.rb'
require 'json'

describe Twilio do 

    before(:all) do 
        stub_request(:post, "https://api.twilio.com/2010-04-01/Accounts/AC1b8ab8e73038fb2409e768ab0535d9ac/SMS/Messages").
            with(body: "From=14153620733&To=12345678&Body=Hello%20World").
            to_return(status: 200, body: "", headers: {})
    end

    it 'uses the Twilio API to send provided message to provided phone number' do
        Twilio.send_message('12345678', 'Hello World', 'AC1b8ab8e73038fb2409e768ab0535d9ac')
        expect(WebMock).to have_requested(:post, 'https://api.twilio.com/2010-04-01/Accounts/AC1b8ab8e73038fb2409e768ab0535d9ac/SMS/Messages')
            .with(body: 'From=14153620733&To=12345678&Body=Hello%20World')
    end
end
