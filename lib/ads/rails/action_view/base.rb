module Ads
  module Rails
    module ActionView
      module Base

        def google_adsense_include_tag(*args)
          options = args.extract_options!
          if ::Rails.env.production?
            script = ''.tap do |script|
              options.each do |key, value|
                if value.is_a? String
                  value = "'#{value}'"
                end
                script << "google_ad_#{key} = #{value};\n"
              end
            end
            content_tag(
              :script,
              script.html_safe,
              type: 'text/javascript'
            ) +
            content_tag(
              :script,
              nil,
              type: 'text/javascript',
              src: "#{request.protocol}pagead2.googlesyndication.com/pagead/show_ads.js"
            )
          elsif Ads.config.renderer.is_a? Proc
            instance_exec options, &Ads.config.renderer
          else
            content_tag(
              :div,
              nil,
              style: "width:#{options[:width]}px;height:#{options[:height]}px;background:#c8c8c8;"
            )
          end
        end

      end
    end
  end
end
