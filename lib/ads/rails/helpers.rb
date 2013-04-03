module Ads
  module Rails
    module Helpers

      def google_adsense_include_tag(*args)
        if ::Rails.env.production?
          options = args.extract_options!
          params = [
            "google_ad_client = '#{options[:client]}'", 
            "google_ad_slot = '#{options[:slot]}'", 
            "google_ad_width = #{options[:width]}", 
            "google_ad_height = #{options[:height]}"
          ]
          content_tag(:script, params.join('; ').html_safe, :type => 'text/javascript') +
          content_tag(:script, nil, :type => 'text/javascript', :src => 'http://pagead2.googlesyndication.com/pagead/show_ads.js')
        end
      end

    end
  end
end
