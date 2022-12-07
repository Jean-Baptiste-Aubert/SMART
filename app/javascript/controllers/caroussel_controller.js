import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="caroussel"
export default class extends Controller {
  static targets = ["input", "arks"]
  connect() {
    this.inputTarget.checked = true;
  }

  unableLink(event) {
    const arkId = event.currentTarget.dataset.arkId
    if (event.currentTarget.classList.contains("active")) {
      window.location.replace(`/arks/${arkId}`)
    }
    this.arksTargets.forEach(ark => {
      ark.classList.remove("active")
    });

    event.currentTarget.classList.add("active")
  }
}
