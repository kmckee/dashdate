require 'spec_helper'

describe Dashdate::App do
  describe '#build' do
    it 'creates an instance of a publisher' do
      app = Dashdate::App.build()
      app.publisher.should_not be_nil
    end
    it 'creates an instance of an arg_parser' do
      app = Dashdate::App.build()
      app.arg_parser.should_not be_nil
    end
  end
  describe '#initialize' do
    it 'assigns the publisher' do
      publisher = double('publisher')
      app = Dashdate::App.new(publisher, nil)
      app.publisher.should == publisher
    end
  end
  describe '#handle_args' do
    let (:publisher) { double('publisher', :update => nil) }
    let (:arg_parser) { double('arg_parser', :parse => {}) }
    subject { Dashdate::App.new(publisher, arg_parser) }

    it 'sends the arguments into the parser' do 
      expected_args = 'dashdate --widget karma --values valuation=100'
      subject.handle_args(expected_args)
      expect(arg_parser).to have_received(:parse).with(expected_args)
    end
    it 'publishes to the correct widget' do
      allow(arg_parser).to receive(:parse).and_return({ :widget => :karma })
      subject.handle_args('')
      expect(publisher).to have_received(:update).with(:karma, anything, anything)
    end
    it 'publishes to other widgets' do
      allow(arg_parser).to receive(:parse).and_return({ :widget => :valuation })
      subject.handle_args('')
      expect(publisher).to have_received(:update).with(:valuation, anything, anything)
    end
    it 'passes the values to the publisher' do
      expected_values = { :value => 100 }
      allow(arg_parser).to receive(:parse).and_return({ :values => expected_values })
      subject.handle_args('')
      expect(publisher).to have_received(:update).with(anything, expected_values, anything)
    end
    it 'passes the auth_token to the publisher' do
      expected_auth = { :auth => 'foo' }
      allow(arg_parser).to receive(:parse).and_return({ :auth => expected_auth })
      subject.handle_args('')
      expect(publisher).to have_received(:update).with(anything, anything, expected_auth)
    end
  end
end

