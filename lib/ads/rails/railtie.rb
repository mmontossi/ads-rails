module Ads
  module Rails
    class Railtie < ::Rails::Railtie

      initializer 'ads.extensions' do
        ::ActionView::Base.include(
          Ads::Rails::Extensions::ActionView::Base
        )
      end

    end
  end
end
