import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  dismiss() {
    const el = this.element

    el.classList.add("opacity-0", "transition-opacity", "duration-300")
    el.addEventListener("transitionend", () => el.remove(), { once: true })
  }
}
