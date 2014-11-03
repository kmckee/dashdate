
When(/^I enter the following in a terminal: "(.*?)"$/) do |user_input|
  Dashdate::App.build.handle_args(user_input)
end

Then(/^the (.*) widget should be updated with the following values:$/) do |widget_name, expected_values_table|
  request = FakeWeb.last_request
  expect(request.method).to eq 'POST'
  expect(request.path).to eq "/widgets/#{widget_name}"
  
  sent_values = JSON.parse(request.body)
  expected = expected_values_table.hashes.first
  expected.keys.each do |key|
    value = expected[key]
    expect(sent_values[key]).to eq value
  end
end
