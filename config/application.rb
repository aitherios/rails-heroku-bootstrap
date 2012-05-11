require File.expand_path('../boot', __FILE__)

require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'active_resource/railtie'
require 'sprockets/railtie'

if defined?(Bundler)
  Bundler.require(*Rails.groups(:assets => %w(development test)))
end

module OutraCoisa
  class Application < Rails::Application
    config.encoding = 'utf-8'
    config.filter_parameters += [:password]
    config.assets.enabled = true
    config.assets.version = '1.0'
    config.generators.stylesheet_engine = :sass
  end
end
