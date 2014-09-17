module Ads
  module Rails
    class Railtie < ::Rails::Railtie

      initializer 'ads.rails' do
        ::ActionView::Base.send :include, Ads::Rails::ActionView::Base
      end

    end
  end
end
