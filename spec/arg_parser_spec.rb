require 'spec_helper'

describe Dashdate::ArgParser do
  subject { Dashdate::ArgParser.new }
  it 'parses the long form of a widget name' do
    subject.parse('dashdate --widget karma --values foo=1')[:widget].should == :karma  
  end
  it 'parses the short form of a widget name' do
    subject.parse('dashdate -w valuation --values foo=1')[:widget].should == :valuation
  end
  it 'parses the widget name regardless of location' do
    subject.parse('dashdate --values foo=1 --widget karma')[:widget].should == :karma  
  end
  it 'parses the values into a hash' do
    subject.parse('dashdate -w karma --values foo=1')[:values].should be_kind_of(Hash)
  end
  it 'sets the keys in the values hash' do
    values = subject.parse('dashdate -w karma --values foo=1')[:values]
    values.keys.should include :foo
  end
  it 'sets the values in the values hash' do
    values = subject.parse('dashdate -w karma --values foo=1')[:values]
    values[:foo].should == '1'
  end
end
