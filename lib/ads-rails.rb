require 'ads/configuration'
require 'ads/rails'

module Ads
  class << self

    def configure
      yield configuration
    end

    def configuration
      @configuration ||= Configuration.new
    end

  end
end
