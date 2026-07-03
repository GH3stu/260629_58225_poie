// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import Rails from "rails-ujs"   // ここに追加！
Rails.start()                  // ここに追加！