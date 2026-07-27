import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]

  toggle(event) {
    if (!this.hasMenuTarget) return
    this.menuTarget.classList.toggle("open")
    if (event?.currentTarget) {
      const isOpen = this.menuTarget.classList.contains("open")
      event.currentTarget.setAttribute("aria-expanded", isOpen ? "true" : "false")
    }
  }

  close() {
    if (!this.hasMenuTarget) return
    this.menuTarget.classList.remove("open")
    const trigger = this.element.querySelector(".hamburger-icon[aria-controls='header-user-menu']")
    if (trigger) trigger.setAttribute("aria-expanded", "false")
  }
}
