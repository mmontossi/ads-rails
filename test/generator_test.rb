require 'test_helper'
require 'rails/generators'
require 'generators/ads/install_generator'

class GeneratorsTest < ::Rails::Generators::TestCase
  destination Rails.root.join('tmp')

  teardown do
    FileUtils.rm_rf destination_root
  end

  test 'install' do
    self.class.tests Ads::Generators::InstallGenerator
    run_generator
    assert_file 'config/initializers/ads.rb'
  end

end
