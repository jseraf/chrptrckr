import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="readmore"
export default class extends Controller {
  static values = { open: Boolean }

  static targets = [ "content", "toggle", "truncated", "full"]

  connect() {
    this.open = false

    this.contentTarget.innerHTML = this.truncatedTarget.innerHTML
  }

  show() {
    this.open = true

    this.contentTarget.innerHTML = this.fullTarget.innerHTML
    this.toggleTarget.innerHTML = 'Read Less'
  }

  hide() {
    this.open = false

    this.contentTarget.innerHTML = this.truncatedTarget.innerHTML
    this.toggleTarget.innerHTML = 'Read More'
  }

  toggle() {
    (this.open === true) ? this.hide() : this.show()
  }
}
