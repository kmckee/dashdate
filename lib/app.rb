module Dashdate
  class App
    attr_accessor :publisher
    def self.build
      new(Dashdate::Publisher.new)
    end
    def initialize publisher
      @publisher = publisher
    end
  end
end
