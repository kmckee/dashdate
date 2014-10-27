require 'spec_helper'
require 'httparty'
describe UpdatePublisher do
  before(:each) { allow(HTTParty).to receive(:post) }
  describe "#update" do
    it "sends a http post to a url" do
      UpdatePublisher.update(:karma, {:current => 100})
      expect(HTTParty).to have_received(:post).with(any_args)
    end
    it "posts to localhost:3030 by default" do
      UpdatePublisher.update(:karma, {:current => 100})
      expect(HTTParty).to have_received(:post).with(/http:\/\/localhost:3030\//, anything)
    end
  end
end
