# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

require File.expand_path('../dummy/config/environment.rb',  __FILE__)
require 'rails/test_help'

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Load fixtures from the engine
if ActiveSupport::TestCase.method_defined?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path('../fixtures', __FILE__)
end

# Load database
config = YAML::load(File.read(File.expand_path('../dummy/config/database.yml', __FILE__)))
config['test']['adapter'] = 'jdbcsqlite3' if RUBY_PLATFORM == 'java'
ActiveRecord::Base.establish_connection(config['test'])
load(File.expand_path('../dummy/db/schema.rb', __FILE__))
