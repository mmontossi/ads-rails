module Ads
  module Rails
    module Extensions
      module ActionView
        module Base
          extend ActiveSupport::Concern

          def google_adsense_include_tag(*args)
            options = args.extract_options!
            if ::Rails.env.production?
              variables = options.map do |key, value|
                "google_ad_#{key} = #{value.to_json};"
              end
              content_tag(
                :script,
                variables.join("\n").html_safe,
                type: 'text/javascript'
              ) +
              content_tag(
                :script,
                nil,
                type: 'text/javascript',
                src: "#{request.protocol}pagead2.googlesyndication.com/pagead/show_ads.js"
              )
            else
              instance_exec options, &Ads.configuration.sample_tag
            end
          end

        end
      end
    end
  end
end
