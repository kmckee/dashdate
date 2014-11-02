require 'httparty'

module Dashdate
  class Publisher
    def update(widget, values)
      widget_string = widget.to_s
      values_json = values.to_json
      HTTParty.post("http://localhost:3030/widgets/#{widget_string}", :body => values_json)
    end
  end
end
