# Dashdate
[![Build Status](https://travis-ci.org/kmckee/dashdate.png)](https://travis-ci.org/kmckee/dashdate)
[![Gem Version](https://badge.fury.io/rb/dashdate.svg)](http://badge.fury.io/rb/dashdate)
[![Code Climate](https://codeclimate.com/github/kmckee/dashdate/badges/gpa.svg)](https://codeclimate.com/github/kmckee/dashdate)
[![Test Coverage](https://codeclimate.com/github/kmckee/dashdate/badges/coverage.svg)](https://codeclimate.com/github/kmckee/dashdate)

Update your dashing dashboards from a command line.

## Installation

Add this line to your application's Gemfile:

    gem 'dashdate'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dashdate

## Usage

To update the Karma widget in the sample app with a new value of 100:

    $ dashdate --widget karma --values value=100 -a YOUR_AUTH_TOKEN

Only works with localhost:3030 right now.  Planning to add support for other urls and aliases next.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/dashdate/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
