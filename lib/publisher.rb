require 'httparty'

module Dashdate
  class Publisher
    def update(widget, values, auth)
      url = "http://localhost:3030/widgets/#{widget.to_s}"
      values[:auth_token] = auth
      result = HTTParty.post(url, :body => values.to_json)
      puts result.inspect
    end
  end
end
