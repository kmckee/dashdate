When(/^I enter the following in a terminal: "(.*?)"$/) do |user_input|
  words = user_input.split
  expect(words.shift). to eq 'dashdate'
  @publisher = double("publisher")
  Dashdate::App.handle_command(words, publisher)
end

Then(/^the (.*) widget should be updated with the following values:$/) do |widget_name, expected_values_table|
  expected_values = expected_values_table.hashes.first
  expect(@publisher).to have_received(:post).with(widget_name.to_sym, expected_values)
end
