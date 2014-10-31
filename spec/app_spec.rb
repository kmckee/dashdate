require 'spec_helper'

describe Dashdate::App do
  describe '#build' do
    it 'creates an instance of a publisher' do
      app = Dashdate::App.build()
      app.publisher.should_not be_nil
    end
  end
  describe '#initialize' do
    it 'assigns the publisher' do
      publisher = double('publisher')
      app = Dashdate::App.new(publisher)
      app.publisher.should == publisher
    end
  end
  describe '#execute_command' do
    let (:publisher) { double('publisher', :update => nil) }
    subject { Dashdate::App.new(publisher) }
    it 'publishes to the correct widget' do
      subject.handle_args(make_into_args('dashdate --widget karma'))
      expect(publisher).to have_received(:update).with(:karma, anything)
    end
    it 'publishes to other widgets' do
      subject.handle_args(make_into_args('dashdate --widget valuation'))
      expect(publisher).to have_received(:update).with(:valuation, anything)
    end
  end
end

def make_into_args string
  string.split
end
