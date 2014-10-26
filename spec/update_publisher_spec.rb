require 'spec_helper'
require 'httparty'
describe UpdatePublisher do
  it "sends a http post to a url" do
    allow(HTTParty).to receive(:post)
    UpdatePublisher.update(:karma, {:current => 100})
    expect(HTTParty).to have_received(:post)
  end
end
