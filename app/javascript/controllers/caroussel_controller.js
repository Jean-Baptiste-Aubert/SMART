import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="caroussel"
export default class extends Controller {
  static targets = ["input"]
  connect() {
    console.log("Hello, Stimulus!", this.inputTarget);
    console.log(this.inputTarget.checked);
    this.inputTarget.checked = true;
    console.log(this.inputTarget.checked);
  }
}
