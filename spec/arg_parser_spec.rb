require 'spec_helper'

describe Dashdate::ArgParser do
  subject { Dashdate::ArgParser.new }
  it 'parses the long form of a widget name' do
    subject.parse('dashdate --widget karma')[:widget].should == :karma  
  end
  it 'parses the short form of a widget name' do
    subject.parse('dashdate -w valuation')[:widget].should == :valuation
  end
  it 'parses the widget name regardless of location' do
    subject.parse('dashdate --values foo=1 --widget karma')[:widget].should == :karma  
  end
  it 'parses the values into a hash'
  it 'sets the keys in the values hash'
  it 'sets the values in the values hash'
end
