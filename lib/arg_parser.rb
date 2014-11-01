require 'trollop'

module Dashdate 
  class ArgParser
    def parse args
      args = args.split.drop(1) unless args.class == Array 
      opts = parse_arg_array args 
      {
        :widget => opts[:widget].to_sym,
        :values => parse_value_string(opts[:values])
      }
    end
    def parse_arg_array args
      Trollop::options(args) do 
        opt :widget, "The name of the widget to publish to", :required => true, :short => :w, :type => String
        opt :values, "The values to push to the widget.  Format is: key1=value1,key2=value2", :required => true, :type => String
      end
    end
    def parse_value_string string
      values = {}
      string.split(',').each do |key_equals_value|
        key_value_pair = key_equals_value.split('=')
        values[key_value_pair.first.to_sym] = key_value_pair.last
      end
      values
    end

  end
end
