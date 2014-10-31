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
    it 'publishes to the correct widget' do
      pending
    end
  end
end
