require 'spec_helper'
require 'httparty'

describe Dashdate::Publisher do
  before(:each) { allow(HTTParty).to receive(:post) }
  describe "#update" do
    subject { Dashdate::Publisher.new }
    it "sends a http post to a url" do
      subject.update(:karma, {:current => 100}, 'auth')
      expect(HTTParty).to have_received(:post).with(any_args)
    end
    it "posts to localhost:3030 by default" do
      subject.update(:karma, {:current => 100}, 'auth')
      expect(HTTParty).to have_received(:post).with(/^http:\/\/localhost:3030\//, anything)
    end
    it "posts to the specified widget" do
      subject.update(:valuation, {:current => 100}, 'auth')
      expect(HTTParty).to have_received(:post).with(/\/widgets\/valuation$/, anything)
    end
    it "posts the values as json" do
      values = {:some_key => "some value"}
      subject.update(:any, values, 'auth')
      expect(HTTParty).to have_received(:post).with(anything, { body: values.to_json })
    end
    it "posts the auth_token" do
      expected_auth_token = 'myAuthToken'
      subject.update(:any, {}, expected_auth_token)
      expect(HTTParty).to have_received(:post).with(anything, { body: {auth_token: expected_auth_token }.to_json })
    end
    it "puts details when a request fails" do

    end
  end
end
