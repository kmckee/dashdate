require 'spec_helper'

describe Dashdate::Notifier do
  it 'puts Successfully published update! when a 200 is received' do
    writer = double('writer', :write => nil)
    subject = Dashdate::Notifier.new(writer)
    subject.received_http_response_code(200)
    expect(writer).to have_received(:write).with('Successfully updated dashboard!')
  end
end
