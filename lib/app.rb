module Dashdate
  class App
    attr_accessor :publisher
    def self.build
      new(Dashdate::Publisher.new)
    end
    def initialize publisher
      @publisher = publisher
    end
    def handle_args args
      @publisher.update(:karma, nil)
    end
  end
end
