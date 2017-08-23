require 'json'
require 'curb'

class Github
    def self.get_activity(name)
      c = Curl::Easy.perform("https://api.github.com/users/ztbrown/events/public") do |curl|
        curl.headers["User-Agent"] = 'remind-me-to-code'
      end
      JSON.parse(c.body_str)
    end
end
