require 'ads/rails'

module Ads
  class << self

    def configure
      yield config
    end

    def config
      @config ||= begin
        ActiveSupport::OrderedOptions.new.tap do |config|
          config.renderer = nil
        end
      end
    end

  end
end
