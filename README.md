[![Gem Version](https://badge.fury.io/rb/ads-rails.svg)](http://badge.fury.io/rb/ads-rails)
[![Code Climate](https://codeclimate.com/github/mmontossi/ads-rails/badges/gpa.svg)](https://codeclimate.com/github/mmontossi/ads-rails)
[![Build Status](https://travis-ci.org/mmontossi/ads-rails.svg)](https://travis-ci.org/mmontossi/ads-rails)
[![Dependency Status](https://gemnasium.com/mmontossi/ads-rails.svg)](https://gemnasium.com/mmontossi/ads-rails)

# Ads Rails

Helper to create the google adsense include tag in rails.

## Why

I did this gem to:

- Have a simple but versatile way to include google adsense.

## Install

Put this line in your Gemfile:
```ruby
gem 'ads-rails'
```

Then bundle:
```
$ bundle
```

## Configuration

Generate the configuration file:
```
$ bundle exec rails g ads:install
```

Customize the sample tag if you want:
```ruby
Ads.configure do |config|

  config.sample_tag do |options|
    style = "width: #{options[:width]}px; height: #{options[:height]}px; background: #c8c8c8;"
    content_tag :div, nil, style: style
  end

end
```

## Usage

In your views call the helper like this:
```erb
<%= google_adsense_include_tag client: 'pub-1234', slot: '1234', ... %>
```

All the arguments will be mapped to the the corresponding google_ad variable:
```ruby
google_ad_client = 'pub-1234'
google_ad_slot = '1234'
.
.
.
```

NOTE: If environment is not production, the sample tag will be shown.

## Credits

This gem is maintained and funded by [mmontossi](https://github.com/mmontossi).

## License

It is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.
