require 'spec_helper'

describe Dashdate::Notifier do
  let(:writer) { double('writer', :write => nil) }
  subject { Dashdate::Notifier.new(writer) }
  it 'notifies success when 204 is received' do
    subject.received_http_response_code(204)
    expect(writer).to have_received(:write).with('Successfully updated dashboard!')
  end
  it 'notifies an authentication problem when a 401 is received.' do
    subject.received_http_response_code(401)
    expect(writer).to have_received(:write).with('Error: Invalid Authentication Token.  Check your config.ru file.')
  end
  it 'notifies if an unknown error occurs' do
    code = 500
    subject.received_http_response_code(code)
    expect(writer).to have_received(:write).with("Unknown error. Received HTTP Response code: #{code}")
  end
  it 'includes the response code if an unknown error occurs' do
    code = 555
    subject.received_http_response_code(code)
    expect(writer).to have_received(:write).with("Unknown error. Received HTTP Response code: #{code}")
  end
end
