module Ads
  module Rails
    class Railtie < ::Rails::Railtie

      config.ads = ActiveSupport::OrderedOptions.new
      config.ads.renderer = nil
 
      initializer 'ads.rails' do
        ::ActionView::Base.send :include, Ads::Rails::ActionView::Base
      end

    end
  end
end
