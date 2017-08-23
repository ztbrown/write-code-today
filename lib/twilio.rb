require 'json'
require 'curb'

class Twilio 
    def self.send_message(phone_number, message, account_number)
        c = Curl::Easy.http_post("https://api.twilio.com/2010-04-01/Accounts/#{account_number}/SMS/Messages",
                                 Curl::PostField.content('From', '14153620733'),
                                 Curl::PostField.content('To', "#{phone_number}"),
                                 Curl::PostField.content('Body', "#{message}")) do |curl|
                                     curl.http_auth_types = :basic
                                     curl.username = ENV['twilio_username']
                                     curl.password = ENV['twilio_password']
                                 end
    end
end
