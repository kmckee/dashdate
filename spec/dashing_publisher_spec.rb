require 'spec_helper'
require 'httparty'

describe DashingPublisher do
  before(:each) { allow(HTTParty).to receive(:post) }
  describe "#update" do
    it "sends a http post to a url" do
      DashingPublisher.update(:karma, {:current => 100})
      expect(HTTParty).to have_received(:post).with(any_args)
    end
    it "posts to localhost:3030 by default" do
      DashingPublisher.update(:karma, {:current => 100})
      expect(HTTParty).to have_received(:post).with(/^http:\/\/localhost:3030\//, anything)
    end
    it "posts to the specified widget" do
      DashingPublisher.update(:valuation, {:current => 100})
      expect(HTTParty).to have_received(:post).with(/\/widgets\/valuation$/, anything)
    end
    it "posts the values as json" do
      values = {:some_key => "some value"}
      DashingPublisher.update(:any, values)
      expect(HTTParty).to have_received(:post).with(anything, values.to_json)
    end
  end
end
