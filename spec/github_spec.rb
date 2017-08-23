require_relative '../lib/github.rb'
require 'json'

describe Github do 

    before(:all) do
        stub_request(:get, "https://api.github.com/users/ztbrown/events/public").
          with(headers: {'User-Agent'=>'remind-me-to-code'}).
          to_return(body: "\[\{ \"created_at\": \"2017-08-23T12:19:37Z\" \}\]", status: 200)
    end

    it 'uses the Github public API to get activity for user' do
        expect(Github.get_activity("ztbrown")).to eq(JSON.parse("\[\{ \"created_at\": \"2017-08-23T12:19:37Z\" \}\]"))
    end
end
