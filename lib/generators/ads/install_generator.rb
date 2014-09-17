require 'rails/generators'

module Ads
  class InstallGenerator < ::Rails::Generators::Base

    source_root File.expand_path('../templates', __FILE__)

    def create_initializer
      copy_file 'ads.rb', 'config/initializers/ads.rb'
    end

  end
end
