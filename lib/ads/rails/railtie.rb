module Ads
  module Rails
    class Railtie < ::Rails::Railtie

      initializer 'ads.helpers' do
        ActionView::Base.send :include, Ads::Rails::Helpers
      end

    end
  end
end
