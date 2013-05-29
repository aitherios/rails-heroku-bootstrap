require File.expand_path('../boot', __FILE__)

require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'active_resource/railtie'
require 'sprockets/railtie'

if defined?(Bundler)
  Bundler.require(*Rails.groups(:assets => %w(development test)))
end

module RailsHerokuBootstrap
  class Application < Rails::Application
    config.autoload_paths += %W(#{config.root}/lib)
    config.encoding = 'utf-8'
    config.filter_parameters += [:password, :password_confirmation]
    config.assets.enabled = true
    config.assets.version = '1.0'
    config.i18n.default_locale = 'pt-BR'
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**/*.{rb,yml}').to_s]
    config.generators.stylesheet_engine = :sass
    config.assets.initialize_on_precompile = false
    config.time_zone = 'Brasilia'
  end
end
