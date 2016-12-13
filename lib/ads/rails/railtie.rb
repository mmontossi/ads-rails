module Ads
  module Rails
    class Railtie < ::Rails::Railtie

      initializer 'ads.action_view' do
        ActiveSupport.on_load :action_view do
          ::ActionView::Base.include(
            Ads::Rails::Extensions::ActionView::Base
          )
        end
      end

    end
  end
end
