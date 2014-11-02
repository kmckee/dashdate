require 'spec_helper'

describe Dashdate::Notifier do
  it 'notifies success when 204 is received' do
    writer = double('writer', :write => nil)
    subject = Dashdate::Notifier.new(writer)
    subject.received_http_response_code(204)
    expect(writer).to have_received(:write).with('Successfully updated dashboard!')
  end
  it 'notifies an authentication problem when a 401 is received.' do
    writer = double('writer', :write => nil)
    subject = Dashdate::Notifier.new(writer)
    subject.received_http_response_code(401)
    expect(writer).to have_received(:write).with('Error: Invalid Authentication Token.  Check your config.ru file.')
  end
end
