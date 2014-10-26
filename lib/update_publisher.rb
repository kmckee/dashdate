require 'httparty'

class UpdatePublisher
  def self.update(widget, values)
    HTTParty.post("some_url", {:key => "value"}.to_json)
  end
end
