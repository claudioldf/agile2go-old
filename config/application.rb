require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "sprockets/railtie"
require 'csv'
# require "rails/test_unit/railtie"

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test production)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Agile
  class Application < Rails::Application    
    config.generators do |g|    
      g.test_framework :rspec, fixture: true
      g.fixture_replacement :factory_girl, dir: 'spec/factories'            
      g.view_specs false
      g.helper_specs false
      g.stylesheets = false
      g.javascripts = false
      g.helper = false
    end    
    config.autoload_paths += %W(#{config.root}/lib)
    config.encoding = "utf-8"
    config.filter_parameters += [:password, :password_confirmation]    
    config.active_support.escape_html_entities_in_json = true        
    config.active_record.whitelist_attributes = true    
    config.assets.enabled = true    
    config.assets.version = '1.0'
    config.assets.initialize_on_precompile = false
    config.action_controller.include_all_helpers = false
    
  end
end
