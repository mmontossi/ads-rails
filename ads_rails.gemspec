$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'ads/rails/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'ads-rails'
  s.version     = Ads::Rails::VERSION
  s.authors     = ['Mattways']
  s.email       = ['contact@mattways.com']
  s.homepage    = 'https://github.com/mattways/ads-rails'
  s.summary     = 'Google Adsense for Rails.'
  s.description = 'Adds a simple view helper to create the google adsense include tag.'
  s.license     = 'MIT'

  s.files = Dir["{app,config,db,lib}/**/*"] + ['MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', (ENV['RAILS_VERSION'] ? "~> #{ENV['RAILS_VERSION']}" : '>= 3.0.0')

  s.add_development_dependency 'sqlite3'
end
