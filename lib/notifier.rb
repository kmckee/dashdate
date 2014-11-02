require 'writer'

module Dashdate
  class Notifier
    def initialize writer
      @writer = writer
    end
    def self.build
      new(Dashdate::Writer.new)
    end
    def received_http_response_code code
      @writer.write('Successfully updated dashboard!')  
    end
  end
end
