// Entry point for the build script in your package.json
import "./controllers"

import "@hotwired/turbo-rails"

window.addEventListener("turbo:load", Pagy.init)
