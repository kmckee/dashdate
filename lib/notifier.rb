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
      case code
        when 204
          @writer.write('Successfully updated dashboard!') 
        when 401 
          @writer.write('Error: Invalid Authentication Token.  Check your config.ru file.')
        else
          @writer.write("Unknown error. Received HTTP Response code: #{code}")
      end
    end
  end
end
