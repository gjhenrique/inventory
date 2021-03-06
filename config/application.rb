require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module ControleEstoque
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.enforce_available_locales = false
    config.i18n.default_locale = "pt-BR"
    config.i18n.fallbacks = true

   # config.time_zone = 'Brasilia'
    #config.active_record.default_timezone = 'Brasilia'

    config.assets.precompile += %w( login.css )

    config.to_prepare do
        Devise::SessionsController.layout "login"
        Devise::RegistrationsController.layout proc{ |controller| user_signed_in? ? "application"   : "login" }
        Devise::ConfirmationsController.layout "login"
        Devise::UnlocksController.layout "login"            
        Devise::PasswordsController.layout "login"        
    end

  end
end
