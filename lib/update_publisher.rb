require 'httparty'

class UpdatePublisher
  def self.update(widget, values)
    HTTParty.post("http://localhost:3030/widgets/#{widget.to_s}", {:key => "value"}.to_json)
  end
end
