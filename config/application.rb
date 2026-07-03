require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Poie
  class Application < Rails::Application
    config.load_defaults 8.0
    config.autoload_lib(ignore: %w[assets tasks])
    # 日本語化設定（ここに追加）
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
  end
end
