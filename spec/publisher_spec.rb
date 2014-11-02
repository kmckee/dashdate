require 'spec_helper'
require 'httparty'

describe Dashdate::Publisher do
  before(:each) { allow(HTTParty).to receive(:post) }
  describe "#update" do
    subject { Dashdate::Publisher.new }
    it "sends a http post to a url" do
      subject.update(:karma, {:current => 100})
      expect(HTTParty).to have_received(:post).with(any_args)
    end
    it "posts to localhost:3030 by default" do
      subject.update(:karma, {:current => 100})
      expect(HTTParty).to have_received(:post).with(/^http:\/\/localhost:3030\//, anything)
    end
    it "posts to the specified widget" do
      subject.update(:valuation, {:current => 100})
      expect(HTTParty).to have_received(:post).with(/\/widgets\/valuation$/, anything)
    end
    it "posts the values as json" do
      values = {:some_key => "some value"}
      subject.update(:any, values)
      expect(HTTParty).to have_received(:post).with(anything, { body: values.to_json })
    end
    it "posts the auth_token"
  end
end
