require 'optparse'

module Dashdate 
  class ArgParser
    def parse args
      args = args.split.drop(1) unless args.class == Array 
      {
        :widget => args[1].to_sym 
      }

    end
  end
end
