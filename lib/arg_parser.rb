require 'trollop'

module Dashdate 
  class ArgParser
    def parse args
      args = args.split.drop(1) unless args.class == Array 
      opts = parse_arg_array(args)
      return {
        :widget => opts[:widget].to_sym,
        :values => parse_value_string(opts[:values]),
        :auth => opts[:auth]
      }
    end
    def parse_arg_array args
      Trollop::options(args) do 
        opt :widget, "The name of the widget to publish to", :required => true, :short => :w, :type => String
        opt :values, "The values to push to the widget.  Format is: key1=value1,key2=value2", :required => true, :type => String
        opt :auth, "Your auth token.  Should match whats in config.ru.", :type => String
      end
    end
    def parse_value_string string
      string.split(',').each_with_object({}) do |key_equals_value, hash|
        key_value_pair = key_equals_value.split('=')
        hash[key_value_pair.first.to_sym] = key_value_pair.last
      end
    end

  end
end
