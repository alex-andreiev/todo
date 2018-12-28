require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module TodoList
  class Application < Rails::Application
    config.load_defaults 5.2
    config.i18n.fallbacks = true
  end
end
