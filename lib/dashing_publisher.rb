require 'httparty'

class DashingPublisher
  def self.update(widget, values)
    HTTParty.post("http://localhost:3030/widgets/#{widget.to_s}", values.to_json)
  end
end
