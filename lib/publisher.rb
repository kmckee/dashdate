require 'httparty'
require 'notifier'

module Dashdate
  class Publisher
    def initialize notifier
      @notifier = notifier
    end
    def self.build
      new(Dashdate::Notifier.build)
    end
    def update(widget, values, auth)
      url = "http://localhost:3030/widgets/#{widget.to_s}"
      values[:auth_token] = auth
      result = HTTParty.post(url, :body => values.to_json)
      @notifier.received_http_response_code(result[:code])
    end
  end
end
