[![Gem Version](https://badge.fury.io/rb/ads-rails.svg)](http://badge.fury.io/rb/ads-rails) [![Code Climate](https://codeclimate.com/github/museways/ads-rails/badges/gpa.svg)](https://codeclimate.com/github/museways/ads-rails) [![Build Status](https://travis-ci.org/museways/ads-rails.svg?branch=0.1.1)](https://travis-ci.org/museways/ads-rails)

# Ads Rails

Adds a simple helper to create the google adsense include tag in rails.

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
rails g ads:install
```

The defaults values are:
```ruby
Ads.configure do |config|
  config.renderer = nil
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

NOTE: If environment is not production, will show a gray rectangle.

## Renderer

To change the output when the environment is not production, add a custom renderer:
```ruby
Ads.configure do |config|
  config.renderer = lambda { |options|
    tag(
      :img,
      src: "http://placehold.it/#{options[:width]}x#{options[:height]}&text=Adsense"
    )
  }
end
```

## Credits

This gem is maintained and funded by [museways](http://museways.com).

## License

It is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.
