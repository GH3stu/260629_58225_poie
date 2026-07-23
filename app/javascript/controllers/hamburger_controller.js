import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]

  toggle() {
    this.menuTarget.classList.toggle("open")
  }

  toggleSidebar() {
    const sidebar = document.getElementById("sidebar")
    if (!sidebar) return

    // スマホ時だけ動作
    if (window.innerWidth <= 767) {
      sidebar.style.display = (sidebar.style.display === "block") ? "none" : "block"
    }
  }
}
