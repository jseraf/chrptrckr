// Entry point for the build script in your package.json
import "./controllers"

import "@hotwired/turbo-rails"

import Pagy from "pagy-module";

window.addEventListener("turbo:load", Pagy.init);
