module Dashdate
  class App
    attr_accessor :publisher
    def self.build
      new(Dashdate::Publisher.new, nil)
    end
    def initialize publisher, arg_parser
      @publisher = publisher
      @arg_parser = arg_parser
    end
    def handle_args args
      parsed_args = @arg_parser.parse(args)
      @publisher.update(parsed_args[:widget], parsed_args[:values])
    end
  end
end
