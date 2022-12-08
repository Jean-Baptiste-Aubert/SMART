import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="collapse"
export default class extends Controller {
  static targets = [ "content" ]

  viewCollapse(event) {
    if (event.target.ariaExpanded == "true") {
      event.target.textContent = "Voir moins";
    } else {
      event.target.textContent = "Voir plus";
    }
  }
}
