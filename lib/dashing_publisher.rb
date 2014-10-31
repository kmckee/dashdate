require 'httparty'

module Dashdate
  class Publisher
    def update(widget, values)
      HTTParty.post("http://localhost:3030/widgets/#{widget.to_s}", values.to_json)
    end
  end
end
