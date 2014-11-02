require 'publisher'
require 'arg_parser'

module Dashdate
  class App
    attr_accessor :publisher, :arg_parser
    def self.build
      new(Dashdate::Publisher.build, Dashdate::ArgParser.new)
    end
    def initialize publisher, arg_parser
      @publisher = publisher
      @arg_parser = arg_parser
    end
    def handle_args args
      parsed = @arg_parser.parse(args)
      @publisher.update(parsed[:widget], parsed[:values], parsed[:auth])
    end
  end
end
